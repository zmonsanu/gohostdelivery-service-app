package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class OrderNotFoundException extends RuntimeException {
    public OrderNotFoundException(UUID id) {
        super("Pedido no encontrado con id: " + id);
    }
}
