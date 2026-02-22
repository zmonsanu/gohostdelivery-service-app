package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.Order;

/**
 * Puerto de salida para notificaciones push a la app móvil.
 * Implementado con Firebase Cloud Messaging (FCM) en la capa de infraestructura.
 */
public interface PushNotificationPublisher {
    void notifyOrderCreated(Order order);
    void notifyOrderStatusChanged(Order order);
}
