package com.zms.gohostdeliveryservice.domain.exception;

import java.util.UUID;

public class CompanyNotFoundException extends RuntimeException {
    public CompanyNotFoundException(UUID id) {
        super("Company no encontrada con id: " + id);
    }
}
