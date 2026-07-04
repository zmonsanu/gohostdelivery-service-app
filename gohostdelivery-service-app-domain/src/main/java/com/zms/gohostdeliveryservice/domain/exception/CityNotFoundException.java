package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class CityNotFoundException extends RuntimeException {
    public CityNotFoundException(UUID id) {
        super("Ciudad no encontrada con id: " + id);
    }
}
