package com.zms.gohostdeliveryservice.application.command.rider;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateRiderCommand {
    private String nombre;
    private String apellido;
    private String docIdentidad;
    private String direccion;
    private String municipio;
    private String provincia;
    private String telefono;
    private String email;
}
