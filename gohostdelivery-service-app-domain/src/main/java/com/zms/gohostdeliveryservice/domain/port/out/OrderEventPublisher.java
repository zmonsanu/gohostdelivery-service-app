package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.Order;

public interface OrderEventPublisher {
    void publishOrderCreated(Order order);
}
