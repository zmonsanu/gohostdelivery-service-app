package com.zms.gohostdeliveryservice.application.command.street;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateStreetCommand {
    private String nombre;
    private UUID idCity;
    private UUID idZone;
    private Integer numMin;
    private Integer numMax;
}
