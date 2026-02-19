package com.zms.gohostdeliveryservice.application.dto;

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
public class ZoneDto {
    private UUID idZone;
    private UUID idCompany;
    private UUID idCity;
    private BigDecimal importeZonaCentro;
    private BigDecimal importeZonaPeriferica;
}
