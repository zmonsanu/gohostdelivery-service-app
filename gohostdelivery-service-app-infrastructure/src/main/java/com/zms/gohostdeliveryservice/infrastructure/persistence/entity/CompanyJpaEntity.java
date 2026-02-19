package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name = "companies")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CompanyJpaEntity {

    @Id
    @Column(columnDefinition = "UUID")
    private UUID id;

    @Column(name = "nombre_comercial", nullable = false)
    private String nombreComercial;

    @Column(name = "representante_legal", nullable = false)
    private String representanteLegal;

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

    private String web;

    @Column(nullable = false)
    private Boolean activo;
}
