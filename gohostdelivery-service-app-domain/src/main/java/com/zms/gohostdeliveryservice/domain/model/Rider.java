package com.zms.gohostdeliveryservice.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Rider {

    private UUID id;
    private String nombre;
    private String apellido;
    private String docIdentidad;
    private String direccion;
    private String municipio;
    private String provincia;
    private String telefono;
    private String email;
    private Boolean activo;
}
