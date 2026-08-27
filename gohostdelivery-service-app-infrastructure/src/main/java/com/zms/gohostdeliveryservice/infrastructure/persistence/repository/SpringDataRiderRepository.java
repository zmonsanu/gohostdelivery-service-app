package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.RiderJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface SpringDataRiderRepository extends JpaRepository<RiderJpaEntity, UUID> {
    boolean existsByEmail(String email);

    @Query("SELECT r FROM RiderJpaEntity r WHERE r.id IN (" +
           "SELECT zr.idRider FROM ZoneRiderJpaEntity zr WHERE zr.idZone IN (" +
           "SELECT z.idZone FROM ZoneJpaEntity z WHERE z.idCity = :cityId" +
           "))")
    List<RiderJpaEntity> findRidersByCityId(@Param("cityId") UUID cityId);
}
