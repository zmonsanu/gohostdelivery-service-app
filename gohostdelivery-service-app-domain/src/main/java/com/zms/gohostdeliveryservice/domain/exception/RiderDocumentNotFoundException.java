package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class RiderDocumentNotFoundException extends RuntimeException {
    public RiderDocumentNotFoundException(UUID id) {
        super("DOCUMENTO de rider no existe con id: " + id);
    }
}
