package com.zms.gohostdeliveryservice.infrastructure.messaging;

import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.port.out.OrderEventPublisher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.function.StreamBridge;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

/**
 * Implementación binder-agnóstica de OrderEventPublisher usando Spring Cloud
 * Stream StreamBridge.
 * - Perfil local → binder Kafka (spring-cloud-stream-binder-kafka)
 * - Perfil GCP → binder Pub/Sub (spring-cloud-gcp-pubsub-stream-binder)
 * Solo cambia la configuración en application-*.yml, el código no varía.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class StreamBridgeOrderEventPublisher implements OrderEventPublisher {

    private static final String ORDER_CREATED_BINDING = "order-created-out-0";

    private final StreamBridge streamBridge;

    @Override
    public void publishOrderCreated(Order order) {
        boolean sent = streamBridge.send(
                ORDER_CREATED_BINDING,
                MessageBuilder
                        .withPayload(order)
                        .setHeader("orderId", order.getIdPedido().toString())
                        .setHeader("companyId", order.getIdCompany().toString())
                        .build());

        if (sent) {
            log.info("Evento order-created enviado [binding={}] pedido={}", ORDER_CREATED_BINDING, order.getIdPedido());
        } else {
            log.warn("No se pudo enviar el evento order-created para pedido={}", order.getIdPedido());
        }
    }
}
