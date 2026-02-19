package com.zms.gohostdeliveryservice.infrastructure.messaging;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.port.out.OrderEventPublisher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
public class KafkaOrderEventPublisher implements OrderEventPublisher {

    private final KafkaTemplate<String, String> kafkaTemplate;
    private final ObjectMapper objectMapper;

    @Value("${kafka.topics.order-created:order-created}")
    private String orderCreatedTopic;

    @Override
    public void publishOrderCreated(Order order) {
        try {
            String message = objectMapper.writeValueAsString(order);
            kafkaTemplate.send(orderCreatedTopic, order.getIdPedido().toString(), message);
            log.info("Evento order-created publicado para pedido: {}", order.getIdPedido());
        } catch (JsonProcessingException e) {
            log.error("Error serializando el pedido para Kafka: {}", e.getMessage());
            throw new RuntimeException("Error publicando evento de pedido", e);
        }
    }
}
