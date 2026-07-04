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
public class StreetDto {
    private UUID id;
    private String nombre;
    private UUID idCity;
    private UUID idZone;
    private Integer numMin;
    private Integer numMax;
}
