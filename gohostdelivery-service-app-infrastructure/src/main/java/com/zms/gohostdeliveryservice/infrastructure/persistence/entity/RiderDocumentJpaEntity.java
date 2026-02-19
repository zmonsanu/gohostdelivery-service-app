package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import com.zms.gohostdeliveryservice.domain.model.enums.TipoDocumento;
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
@Table(name = "rider_documents")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RiderDocumentJpaEntity {

    @Id
    @Column(columnDefinition = "UUID")
    private UUID id;

    @Column(name = "rider_id", nullable = false, columnDefinition = "UUID")
    private UUID riderId;

    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(name = "tipo_documento", nullable = false, columnDefinition = "tipo_documento")
    private TipoDocumento tipoDocumento;

    @Column(name = "nombre_fichero", nullable = false)
    private String nombreFichero;

    @Column(name = "content_type", nullable = false)
    private String contentType;

    @Column(name = "fecha_subida", nullable = false)
    private LocalDateTime fechaSubida;
}
