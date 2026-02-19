package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.CityJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface SpringDataCityRepository extends JpaRepository<CityJpaEntity, UUID> {
}
