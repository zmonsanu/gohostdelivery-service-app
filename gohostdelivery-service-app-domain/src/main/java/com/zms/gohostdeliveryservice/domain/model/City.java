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
public class City {

    private UUID id;
    private String nombre;
    private String provincia;
    private String comunidadAutonoma;
}
