package com.zms.gohostdeliveryservice.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CityDto {
    private UUID id;
    private String nombre;
    private String provincia;
    private String comunidadAutonoma;
}
