package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name = "rider_document_blobs")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RiderDocumentBlobJpaEntity {

    @Id
    @Column(columnDefinition = "UUID")
    private UUID id;

    @Column(name = "rider_document_id", nullable = false, columnDefinition = "UUID")
    private UUID riderDocumentId;

    @JdbcTypeCode(SqlTypes.BINARY)
    @Column(name = "contenido", nullable = false, columnDefinition = "BYTEA")
    private byte[] contenido;
}
