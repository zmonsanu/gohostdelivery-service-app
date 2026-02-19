package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name = "cities")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CityJpaEntity {

    @Id
    @Column(columnDefinition = "UUID")
    private UUID id;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private String provincia;

    @Column(name = "comunidad_autonoma", nullable = false)
    private String comunidadAutonoma;
}
