package com.zms.gohostdeliveryservice.infrastructure.persistence.entity;

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
@Table(name = "orders")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderJpaEntity {

    @Id
    @Column(name = "id_pedido", columnDefinition = "UUID")
    private UUID idPedido;

    @Column(name = "numero_pedido", nullable = false, unique = true)
    private String numeroPedido;

    @Column(name = "id_company", nullable = false, columnDefinition = "UUID")
    private UUID idCompany;

    @Column(name = "id_zone", columnDefinition = "UUID")
    private UUID idZone;

    @Column(name = "id_rider", columnDefinition = "UUID")
    private UUID idRider;

    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(name = "estado", nullable = false, columnDefinition = "order_status")
    private com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus estado;

    @Column(name = "fecha_creacion", nullable = false)
    private LocalDateTime fechaCreacion;

    @Column(name = "fecha_entrega")
    private LocalDateTime fechaEntrega;

    @Column(name = "lugar_entrega")
    private String lugarEntrega;

    @Column(nullable = false)
    private Boolean pagado;
}
