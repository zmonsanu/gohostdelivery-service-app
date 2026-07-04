package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class StreetNotFoundException extends RuntimeException {
    public StreetNotFoundException(UUID id) {
        super("Calle no encontrada con id: " + id);
    }
}
