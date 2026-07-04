package com.zms.gohostdeliveryservice.domain.port;

public interface PizzaGestSchedulerControl {
    boolean isActive();
    void setActive(boolean active);
}
