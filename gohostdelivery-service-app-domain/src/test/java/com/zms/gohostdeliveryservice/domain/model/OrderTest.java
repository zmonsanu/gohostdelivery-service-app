package com.zms.gohostdeliveryservice.domain.model;

import com.zms.gohostdeliveryservice.domain.exception.OrderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.UUID;

import static org.assertj.core.api.Assertions.*;

@DisplayName("Domain - Order model y excepciones")
class OrderTest {

    @Test
    @DisplayName("Order.builder() crea el pedido con estado RECIBIDO y pagado=false por defecto")
    void order_builder_defaultValues() {
        UUID idPedido = UUID.randomUUID();

        Order order = Order.builder()
                .idPedido(idPedido)
                .numeroPedido("PED-001")
                .idCompany(UUID.randomUUID())
                .estado(OrderStatus.RECIBIDO)
                .fechaCreacion(LocalDateTime.now())
                .pagado(false)
                .build();

        assertThat(order.getIdPedido()).isEqualTo(idPedido);
        assertThat(order.getNumeroPedido()).isEqualTo("PED-001");
        assertThat(order.getEstado()).isEqualTo(OrderStatus.RECIBIDO);
        assertThat(order.getPagado()).isFalse();
        assertThat(order.getFechaEntrega()).isNull();
        assertThat(order.getLugarEntrega()).isNull();
    }

    @Test
    @DisplayName("Order permite cambiar el estado manualmente")
    void order_allowsStatusChange() {
        Order order = Order.builder()
                .idPedido(UUID.randomUUID())
                .numeroPedido("PED-002")
                .idCompany(UUID.randomUUID())
                .estado(OrderStatus.RECIBIDO)
                .fechaCreacion(LocalDateTime.now())
                .pagado(false)
                .build();

        order.setEstado(OrderStatus.EN_PROCESO);
        assertThat(order.getEstado()).isEqualTo(OrderStatus.EN_PROCESO);

        order.setEstado(OrderStatus.ENTREGADO);
        assertThat(order.getEstado()).isEqualTo(OrderStatus.ENTREGADO);
    }

    @Test
    @DisplayName("OrderNotFoundException contiene el UUID del pedido en el mensaje")
    void orderNotFoundException_containsUuid() {
        UUID id = UUID.randomUUID();
        OrderNotFoundException ex = new OrderNotFoundException(id);
        assertThat(ex.getMessage()).contains(id.toString());
    }
}
