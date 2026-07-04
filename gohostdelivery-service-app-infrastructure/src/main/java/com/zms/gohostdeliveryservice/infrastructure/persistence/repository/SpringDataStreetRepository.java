package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.StreetJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SpringDataStreetRepository extends JpaRepository<StreetJpaEntity, UUID> {
    List<StreetJpaEntity> findByIdCity(UUID idCity);
    List<StreetJpaEntity> findByIdZone(UUID idZone);
}
