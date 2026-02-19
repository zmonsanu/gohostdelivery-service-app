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
public class CreateZoneCommand {
    private UUID idCompany;
    private UUID idCity;
    private BigDecimal importeZonaCentro;
    private BigDecimal importeZonaPeriferica;
}
