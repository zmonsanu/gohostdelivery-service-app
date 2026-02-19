package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.OrderJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface SpringDataOrderRepository extends JpaRepository<OrderJpaEntity, UUID> {
    List<OrderJpaEntity> findByIdCompany(UUID idCompany);

    List<OrderJpaEntity> findByIdRider(UUID idRider);

    List<OrderJpaEntity> findByEstado(OrderStatus estado);

    boolean existsByNumeroPedido(String numeroPedido);
}
