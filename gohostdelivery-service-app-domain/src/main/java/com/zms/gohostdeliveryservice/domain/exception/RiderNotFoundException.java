package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class RiderNotFoundException extends RuntimeException {
    public RiderNotFoundException(UUID id) {
        super("Rider no encontrado con id: " + id);
    }
}
