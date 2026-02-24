package com.zms.gohostdeliveryservice.application.command.rider;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PartialUpdateRiderCommand {
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
