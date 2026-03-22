package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "zone_riders")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ZoneRiderJpaEntity {

    @Id
    @Column(name = "id_zone_rider", columnDefinition = "UUID")
    private UUID idZoneRider;

    @Column(name = "id_zone", nullable = false, columnDefinition = "UUID")
    private UUID idZone;

    @Column(name = "id_rider", nullable = false, columnDefinition = "UUID")
    private UUID idRider;

    @Column(name = "fecha_asignacion", nullable = false)
    private LocalDateTime fechaAsignacion;
}
