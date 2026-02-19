package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.RiderDocumentJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface SpringDataRiderDocumentRepository extends JpaRepository<RiderDocumentJpaEntity, UUID> {
    List<RiderDocumentJpaEntity> findByRiderId(UUID riderId);
}
