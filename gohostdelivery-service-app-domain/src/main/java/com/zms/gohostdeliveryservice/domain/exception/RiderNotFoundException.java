package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class RiderNotFoundException extends RuntimeException {
    public RiderNotFoundException(UUID id) {
        super("RIDER no existe con id: " + id);
    }
}
