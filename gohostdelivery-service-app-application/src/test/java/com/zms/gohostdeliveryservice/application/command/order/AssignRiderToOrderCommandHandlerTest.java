package com.zms.gohostdeliveryservice.application.command.order;

import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.domain.exception.OrderNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.Rider;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
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
@DisplayName("Application - AssignRiderToOrderCommandHandler")
class AssignRiderToOrderCommandHandlerTest {

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private RiderRepository riderRepository;

    @InjectMocks
    private AssignRiderToOrderCommandHandler handler;

    private UUID orderId;
    private UUID riderId;
    private Order order;
    private Rider rider;

    @BeforeEach
    void setUp() {
        orderId = UUID.randomUUID();
        riderId = UUID.randomUUID();

        order = Order.builder()
                .idPedido(orderId)
                .numeroPedido("PED-001")
                .idCompany(UUID.randomUUID())
                .estado(OrderStatus.RECIBIDO)
                .fechaCreacion(LocalDateTime.now())
                .pagado(false)
                .build();

        rider = Rider.builder()
                .id(riderId)
                .nombre("Marcos")
                .apellido("González")
                .docIdentidad("99999999Z")
                .direccion("Calle del Sur 5")
                .municipio("Málaga")
                .provincia("Málaga")
                .telefono("611222333")
                .email("marcos@rider.com")
                .activo(true)
                .build();
    }

    @Test
    @DisplayName("handle() asigna el rider al pedido correctamente")
    void handle_assignsRider_toOrder() {
        Order savedOrder = Order.builder()
                .idPedido(orderId)
                .numeroPedido("PED-001")
                .idCompany(order.getIdCompany())
                .idRider(riderId)
                .estado(OrderStatus.RECIBIDO)
                .fechaCreacion(order.getFechaCreacion())
                .pagado(false)
                .build();

        when(orderRepository.findById(orderId)).thenReturn(Optional.of(order));
        when(riderRepository.findById(riderId)).thenReturn(Optional.of(rider));
        when(orderRepository.save(any(Order.class))).thenReturn(savedOrder);

        AssignRiderToOrderCommand command = AssignRiderToOrderCommand.builder()
                .orderId(orderId)
                .riderId(riderId)
                .build();

        OrderDto result = handler.handle(command);

        assertThat(result.getIdRider()).isEqualTo(riderId);
        verify(orderRepository).save(any(Order.class));
    }

    @Test
    @DisplayName("handle() lanza OrderNotFoundException si el pedido no existe")
    void handle_throwsOrderNotFoundException_whenOrderNotFound() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.empty());

        AssignRiderToOrderCommand command = AssignRiderToOrderCommand.builder()
                .orderId(orderId)
                .riderId(riderId)
                .build();

        assertThatThrownBy(() -> handler.handle(command))
                .isInstanceOf(OrderNotFoundException.class)
                .hasMessageContaining(orderId.toString());

        verify(riderRepository, never()).findById(any());
        verify(orderRepository, never()).save(any());
    }

    @Test
    @DisplayName("handle() lanza RiderNotFoundException si el rider no existe")
    void handle_throwsRiderNotFoundException_whenRiderNotFound() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(order));
        when(riderRepository.findById(riderId)).thenReturn(Optional.empty());

        AssignRiderToOrderCommand command = AssignRiderToOrderCommand.builder()
                .orderId(orderId)
                .riderId(riderId)
                .build();

        assertThatThrownBy(() -> handler.handle(command))
                .isInstanceOf(RiderNotFoundException.class)
                .hasMessageContaining(riderId.toString());

        verify(orderRepository, never()).save(any());
    }
}
