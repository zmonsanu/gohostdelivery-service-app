package com.zms.gohostdeliveryservice.application.command.order;

import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.domain.exception.OrderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import com.zms.gohostdeliveryservice.domain.port.out.PushNotificationPublisher;
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
@DisplayName("Application - DeliverOrderCommandHandler")
class DeliverOrderCommandHandlerTest {

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private PushNotificationPublisher pushNotificationPublisher;

    @InjectMocks
    private DeliverOrderCommandHandler handler;

    private UUID orderId;
    private Order order;

    @BeforeEach
    void setUp() {
        orderId = UUID.randomUUID();
        order = Order.builder()
                .idPedido(orderId)
                .numeroPedido("PED-DELIVER-001")
                .idCompany(UUID.randomUUID())
                .idRider(UUID.randomUUID())
                .estado(OrderStatus.EN_PROCESO)
                .fechaCreacion(LocalDateTime.now().minusHours(2))
                .pagado(false)
                .build();
    }

    @Test
    @DisplayName("handle() marca el pedido como ENTREGADO con fecha y lugar de entrega")
    void handle_marksOrderAsDelivered() {
        Order savedOrder = Order.builder()
                .idPedido(orderId)
                .numeroPedido(order.getNumeroPedido())
                .idCompany(order.getIdCompany())
                .idRider(order.getIdRider())
                .estado(OrderStatus.ENTREGADO)
                .fechaCreacion(order.getFechaCreacion())
                .fechaEntrega(LocalDateTime.now())
                .lugarEntrega("Calle Mayor 5, Madrid")
                .pagado(false)
                .build();

        when(orderRepository.findById(orderId)).thenReturn(Optional.of(order));
        when(orderRepository.save(any(Order.class))).thenReturn(savedOrder);

        DeliverOrderCommand command = DeliverOrderCommand.builder()
                .orderId(orderId)
                .lugarEntrega("Calle Mayor 5, Madrid")
                .build();

        OrderDto result = handler.handle(command);

        assertThat(result.getEstado()).isEqualTo(OrderStatus.ENTREGADO);
        assertThat(result.getFechaEntrega()).isNotNull();
        assertThat(result.getLugarEntrega()).isEqualTo("Calle Mayor 5, Madrid");
        verify(pushNotificationPublisher).notifyOrderStatusChanged(any(Order.class));
    }

    @Test
    @DisplayName("handle() lanza OrderNotFoundException si el pedido no existe")
    void handle_throwsOrderNotFoundException_whenOrderNotFound() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.empty());

        DeliverOrderCommand command = DeliverOrderCommand.builder()
                .orderId(orderId)
                .lugarEntrega("Calle Mayor 5, Madrid")
                .build();

        assertThatThrownBy(() -> handler.handle(command))
                .isInstanceOf(OrderNotFoundException.class)
                .hasMessageContaining(orderId.toString());

        verify(orderRepository, never()).save(any());
    }
}
