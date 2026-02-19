package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.ZoneJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface SpringDataZoneRepository extends JpaRepository<ZoneJpaEntity, UUID> {
    List<ZoneJpaEntity> findByIdCompany(UUID idCompany);
}
