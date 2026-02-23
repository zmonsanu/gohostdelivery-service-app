package com.zms.gohostdeliveryservice.infrastructure.notification;

import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.port.out.PushNotificationPublisher;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.stereotype.Component;

/**
 * Implementación NO-OP de PushNotificationPublisher.
 * Se activa cuando Firebase NO está habilitado (gohost.fcm.enabled=false o sin configurar).
 * Simplemente loguea la notificación sin enviarla.
 *
 * Para activar FCM real: gohost.fcm.enabled=true (y configurar GOOGLE_APPLICATION_CREDENTIALS
 * o usar Application Default Credentials en Cloud Run).
 */
@Slf4j
@Component
@ConditionalOnMissingBean(FcmPushNotificationPublisher.class)
public class NoOpPushNotificationPublisher implements PushNotificationPublisher {

    @Override
    public void notifyOrderCreated(Order order) {
        log.debug("[NoOp] Notificación order-created ignorada (FCM no habilitado) pedido={}", order.getIdPedido());
    }

    @Override
    public void notifyOrderStatusChanged(Order order) {
        log.debug("[NoOp] Notificación order-status-changed ignorada (FCM no habilitado) pedido={} estado={}",
                order.getIdPedido(), order.getEstado());
    }
}
