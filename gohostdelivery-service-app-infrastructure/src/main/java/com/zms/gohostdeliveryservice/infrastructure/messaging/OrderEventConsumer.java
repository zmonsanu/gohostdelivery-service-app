package com.zms.gohostdeliveryservice.infrastructure.messaging;

import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.port.out.PushNotificationPublisher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.function.Consumer;

/**
 * Consumidor de eventos de pedidos.
 * Procesa los eventos publicados en el bus (Kafka/PubSub) para realizar tareas
 * secundarias
 * como el envío de notificaciones push de forma asíncrona.
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class OrderEventConsumer {

    private final PushNotificationPublisher pushNotificationPublisher;

    @Bean
    public Consumer<Order> orderCreatedConsumer() {
        return order -> {
            log.info("Evento recibido para encolar notificación: pedido={}", order.getIdPedido());
            try {
                pushNotificationPublisher.notifyOrderCreated(order);
            } catch (Exception e) {
                log.error("Error al procesar notificación asíncrona para pedido {}: {}",
                        order.getIdPedido(), e.getMessage());
            }
        };
    }
}
