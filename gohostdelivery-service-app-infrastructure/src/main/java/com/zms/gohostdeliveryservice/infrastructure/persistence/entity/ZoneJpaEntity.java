package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.UUID;

@Entity
@Table(name = "zones")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ZoneJpaEntity {

    @Id
    @Column(name = "id_zone", columnDefinition = "UUID")
    private UUID idZone;

    @Column(name = "id_company", nullable = false, columnDefinition = "UUID")
    private UUID idCompany;

    @Column(name = "id_city", nullable = false, columnDefinition = "UUID")
    private UUID idCity;

    @Column(name = "importe_zona_centro", nullable = false, precision = 10, scale = 2)
    private BigDecimal importeZonaCentro;

    @Column(name = "importe_zona_periferica", nullable = false, precision = 10, scale = 2)
    private BigDecimal importeZonaPeriferica;
}
