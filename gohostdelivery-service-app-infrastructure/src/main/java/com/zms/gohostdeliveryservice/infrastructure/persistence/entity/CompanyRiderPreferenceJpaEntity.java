package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import com.zms.gohostdeliveryservice.domain.model.enums.TipoPreferencia;
import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "company_rider_preferences")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CompanyRiderPreferenceJpaEntity {

    @Id
    @Column(name = "id_preference", columnDefinition = "UUID")
    private UUID idPreference;

    @Column(name = "id_company", nullable = false, columnDefinition = "UUID")
    private UUID idCompany;

    @Column(name = "id_rider", nullable = false, columnDefinition = "UUID")
    private UUID idRider;

    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(name = "tipo_preferencia", nullable = false, columnDefinition = "tipo_preferencia")
    private TipoPreferencia tipoPreferencia;

    @Column(name = "fecha_asignacion", nullable = false)
    private LocalDateTime fechaAsignacion;
}
