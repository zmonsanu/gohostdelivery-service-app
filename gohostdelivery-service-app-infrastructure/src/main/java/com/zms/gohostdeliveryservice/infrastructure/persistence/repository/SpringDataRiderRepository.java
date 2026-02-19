package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.RiderJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface SpringDataRiderRepository extends JpaRepository<RiderJpaEntity, UUID> {
    boolean existsByEmail(String email);
}
