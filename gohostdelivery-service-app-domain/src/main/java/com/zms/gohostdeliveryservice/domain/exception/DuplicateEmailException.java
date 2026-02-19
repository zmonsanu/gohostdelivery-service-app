package com.zms.gohostdeliveryservice.domain.exception;

public class DuplicateEmailException extends RuntimeException {
    public DuplicateEmailException(String email) {
        super("Ya existe un registro con el email: " + email);
    }
}
