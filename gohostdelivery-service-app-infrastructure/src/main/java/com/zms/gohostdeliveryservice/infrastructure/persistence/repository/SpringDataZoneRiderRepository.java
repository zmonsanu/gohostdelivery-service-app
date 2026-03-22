package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.ZoneRiderJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface SpringDataZoneRiderRepository extends JpaRepository<ZoneRiderJpaEntity, UUID> {
    
    void deleteByIdZoneAndIdRider(UUID idZone, UUID idRider);
    
    boolean existsByIdZoneAndIdRider(UUID idZone, UUID idRider);
    
    @Query("SELECT zr.idRider FROM ZoneRiderJpaEntity zr WHERE zr.idZone = :idZone")
    List<UUID> findIdRiderByIdZone(UUID idZone);
}
