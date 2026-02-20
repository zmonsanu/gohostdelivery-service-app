package com.zms.gohostdeliveryservice.application.command.order;

import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import com.zms.gohostdeliveryservice.domain.port.out.OrderEventPublisher;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("Application - CreateOrderCommandHandler")
class CreateOrderCommandHandlerTest {

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private CompanyRepository companyRepository;

    @Mock
    private OrderEventPublisher orderEventPublisher;

    @InjectMocks
    private CreateOrderCommandHandler handler;

    private UUID companyId;
    private Company company;
    private CreateOrderCommand command;

    @BeforeEach
    void setUp() {
        companyId = UUID.randomUUID();

        company = Company.builder()
                .id(companyId)
                .nombreComercial("GoHost SL")
                .representanteLegal("Carlos López")
                .docIdentidad("11111111C")
                .direccion("Av. España 10")
                .municipio("Valencia")
                .provincia("Valencia")
                .telefono("600111222")
                .email("info@gohost.es")
                .activo(true)
                .build();

        command = CreateOrderCommand.builder()
                .idCompany(companyId)
                .idZone(UUID.randomUUID())
                .numeroPedido("PED-2024-001")
                .build();
    }

    @Test
    @DisplayName("handle() crea un pedido con estado RECIBIDO cuando la empresa existe")
    void handle_createsOrder_whenCompanyExists() {
        Order savedOrder = Order.builder()
                .idPedido(UUID.randomUUID())
                .numeroPedido(command.getNumeroPedido())
                .idCompany(companyId)
                .idZone(command.getIdZone())
                .estado(OrderStatus.RECIBIDO)
                .fechaCreacion(LocalDateTime.now())
                .pagado(false)
                .build();

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(orderRepository.save(any(Order.class))).thenReturn(savedOrder);

        OrderDto result = handler.handle(command);

        assertThat(result).isNotNull();
        assertThat(result.getNumeroPedido()).isEqualTo("PED-2024-001");
        assertThat(result.getEstado()).isEqualTo(OrderStatus.RECIBIDO);
        assertThat(result.getPagado()).isFalse();
        verify(orderRepository).save(any(Order.class));
        verify(orderEventPublisher).publishOrderCreated(any(Order.class));
    }

    @Test
    @DisplayName("handle() lanza CompanyNotFoundException cuando la empresa no existe")
    void handle_throwsCompanyNotFoundException_whenCompanyNotFound() {
        when(companyRepository.findById(companyId)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> handler.handle(command))
                .isInstanceOf(CompanyNotFoundException.class)
                .hasMessageContaining(companyId.toString());

        verify(orderRepository, never()).save(any());
        verify(orderEventPublisher, never()).publishOrderCreated(any());
    }

    @Test
    @DisplayName("handle() publica evento Kafka tras guardar el pedido")
    void handle_publishesKafkaEvent_afterSavingOrder() {
        Order savedOrder = Order.builder()
                .idPedido(UUID.randomUUID())
                .numeroPedido(command.getNumeroPedido())
                .idCompany(companyId)
                .estado(OrderStatus.RECIBIDO)
                .fechaCreacion(LocalDateTime.now())
                .pagado(false)
                .build();

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(orderRepository.save(any())).thenReturn(savedOrder);

        handler.handle(command);

        verify(orderEventPublisher, times(1)).publishOrderCreated(savedOrder);
    }
}
