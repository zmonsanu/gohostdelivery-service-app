package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class RiderDocumentNotFoundException extends RuntimeException {
    public RiderDocumentNotFoundException(UUID id) {
        super("Documento de rider no encontrado con id: " + id);
    }
}
