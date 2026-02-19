package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class ZoneNotFoundException extends RuntimeException {
    public ZoneNotFoundException(UUID id) {
        super("Zona no encontrada con id: " + id);
    }
}
