package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name = "streets", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id_city", "nombre", "num_min", "num_max"})
})
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StreetJpaEntity {

    @Id
    @Column(columnDefinition = "UUID")
    private UUID id;

    @Column(nullable = false)
    private String nombre;

    @Column(name = "id_city", nullable = false, columnDefinition = "UUID")
    private UUID idCity;

    @Column(name = "id_zone", columnDefinition = "UUID")
    private UUID idZone;

    @Column(name = "num_min")
    private Integer numMin;

    @Column(name = "num_max")
    private Integer numMax;
}
