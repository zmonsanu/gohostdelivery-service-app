package com.zms.gohostdeliveryservice.application.command.company;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PartialUpdateCompanyCommand {
    private UUID id;
    private String nombreComercial;
    private String representanteLegal;
    private String docIdentidad;
    private String direccion;
    private String municipio;
    private String provincia;
    private String telefono;
    private String email;
    private String web;
    private Boolean activo;
}
