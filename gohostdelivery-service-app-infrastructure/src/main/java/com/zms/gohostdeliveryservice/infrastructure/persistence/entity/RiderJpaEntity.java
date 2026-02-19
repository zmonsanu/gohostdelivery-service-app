package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name = "riders")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RiderJpaEntity {

    @Id
    @Column(columnDefinition = "UUID")
    private UUID id;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private String apellido;

    @Column(name = "doc_identidad", nullable = false)
    private String docIdentidad;

    @Column(nullable = false)
    private String direccion;

    @Column(nullable = false)
    private String municipio;

    @Column(nullable = false)
    private String provincia;

    @Column(nullable = false)
    private String telefono;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private Boolean activo;
}
