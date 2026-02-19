package com.zms.gohostdeliveryservice.rest.exception;

import com.zms.gohostdeliveryservice.domain.exception.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.LocalDateTime;
import java.util.Map;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler({
            RiderNotFoundException.class,
            CompanyNotFoundException.class,
            ZoneNotFoundException.class,
            OrderNotFoundException.class,
            RiderDocumentNotFoundException.class
    })
    public ResponseEntity<Map<String, Object>> handleNotFound(RuntimeException ex) {
        log.warn("Recurso no encontrado: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorBody(ex.getMessage(), 404));
    }

    @ExceptionHandler(DuplicateEmailException.class)
    public ResponseEntity<Map<String, Object>> handleDuplicateEmail(DuplicateEmailException ex) {
        log.warn("Email duplicado: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.CONFLICT).body(errorBody(ex.getMessage(), 409));
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, Object>> handleBadRequest(IllegalArgumentException ex) {
        log.warn("Argumento inválido: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorBody(ex.getMessage(), 400));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, Object>> handleGeneral(Exception ex) {
        log.error("Error inesperado: {}", ex.getMessage(), ex);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(errorBody("Error interno del servidor", 500));
    }

    private Map<String, Object> errorBody(String message, int status) {
        return Map.of(
                "timestamp", LocalDateTime.now().toString(),
                "status", status,
                "message", message);
    }
}
