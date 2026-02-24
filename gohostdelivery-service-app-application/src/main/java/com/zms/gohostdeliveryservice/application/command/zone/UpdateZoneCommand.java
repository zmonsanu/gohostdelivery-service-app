package com.zms.gohostdeliveryservice.application.command.zone;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UpdateZoneCommand {
    private UUID idZone;
    private UUID idCity;
    private BigDecimal importeZonaCentro;
    private BigDecimal importeZonaPeriferica;
    private String descripcion;
}
