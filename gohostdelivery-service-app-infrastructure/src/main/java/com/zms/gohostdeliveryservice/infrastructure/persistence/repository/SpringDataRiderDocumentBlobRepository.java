package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.RiderDocumentBlobJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface SpringDataRiderDocumentBlobRepository extends JpaRepository<RiderDocumentBlobJpaEntity, UUID> {
    Optional<RiderDocumentBlobJpaEntity> findByRiderDocumentId(UUID riderDocumentId);
}
