package com.zms.gohostdeliveryservice.infrastructure.notification;

import com.google.firebase.FirebaseApp;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.port.out.PushNotificationPublisher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

/**
 * Implementación FCM activa solo cuando gohost.fcm.enabled=true.
 * En Cloud Run, configurar esta propiedad + habilitar Firebase en el proyecto GCP.
 */
@Slf4j
@Component
@RequiredArgsConstructor
@ConditionalOnProperty(name = "gohost.fcm.enabled", havingValue = "true")
public class FcmPushNotificationPublisher implements PushNotificationPublisher {

    private final FirebaseApp firebaseApp;

    @Override
    public void notifyOrderCreated(Order order) {
        String topic = "company-" + order.getIdCompany();

        Message message = Message.builder()
                .setTopic(topic)
                .setNotification(Notification.builder()
                        .setTitle("📦 Nuevo pedido recibido")
                        .setBody("Pedido #" + order.getNumeroPedido() + " ha sido creado")
                        .build())
                .putData("type", "ORDER_CREATED")
                .putData("orderId", order.getIdPedido().toString())
                .putData("numeroPedido", order.getNumeroPedido())
                .putData("estado", order.getEstado().toString())
                .putData("companyId", order.getIdCompany().toString())
                .build();

        sendMessage(message, topic);
    }

    @Override
    public void notifyOrderStatusChanged(Order order) {
        String topic = "company-" + order.getIdCompany();
        String statusEmoji = getStatusEmoji(order.getEstado().toString());

        Message message = Message.builder()
                .setTopic(topic)
                .setNotification(Notification.builder()
                        .setTitle(statusEmoji + " Estado actualizado")
                        .setBody("Pedido #" + order.getNumeroPedido() + " → " + order.getEstado())
                        .build())
                .putData("type", "ORDER_STATUS_CHANGED")
                .putData("orderId", order.getIdPedido().toString())
                .putData("numeroPedido", order.getNumeroPedido())
                .putData("estado", order.getEstado().toString())
                .putData("companyId", order.getIdCompany().toString())
                .build();

        sendMessage(message, topic);

        // Si tiene rider asignado, notificar también al rider
        if (order.getIdRider() != null) {
            String riderTopic = "rider-" + order.getIdRider();
            Message riderMessage = Message.builder()
                    .setTopic(riderTopic)
                    .setNotification(Notification.builder()
                            .setTitle(statusEmoji + " Pedido actualizado")
                            .setBody("Pedido #" + order.getNumeroPedido() + " → " + order.getEstado())
                            .build())
                    .putData("type", "ORDER_STATUS_CHANGED")
                    .putData("orderId", order.getIdPedido().toString())
                    .putData("estado", order.getEstado().toString())
                    .build();
            sendMessage(riderMessage, riderTopic);
        }
    }

    private void sendMessage(Message message, String topic) {
        try {
            String messageId = FirebaseMessaging.getInstance(firebaseApp).send(message);
            log.info("Notificación FCM enviada [topic={}] messageId={}", topic, messageId);
        } catch (FirebaseMessagingException e) {
            // No lanzamos excepción: las notificaciones no deben bloquear el flujo de negocio
            log.error("Error enviando notificación FCM [topic={}]: {}", topic, e.getMessage());
        }
    }

    private String getStatusEmoji(String status) {
        return switch (status) {
            case "RECIBIDO"   -> "📬";
            case "EN_CAMINO"  -> "🚴";
            case "ENTREGADO"  -> "✅";
            case "CANCELADO"  -> "❌";
            default           -> "📦";
        };
    }
}
