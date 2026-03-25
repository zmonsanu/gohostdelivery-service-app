package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.port.out.ZoneRiderRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.ZoneRiderJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataZoneRiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Component
@RequiredArgsConstructor
public class ZoneRiderRepositoryAdapter implements ZoneRiderRepository {

    private final SpringDataZoneRiderRepository springDataZoneRiderRepository;

    @Override
    public void assignRiderToZone(UUID idZone, UUID idRider) {
        if (!existsByZoneAndRider(idZone, idRider)) {
            ZoneRiderJpaEntity entity = ZoneRiderJpaEntity.builder()
                    .idZoneRider(UUID.randomUUID())
                    .idZone(idZone)
                    .idRider(idRider)
                    .fechaAsignacion(LocalDateTime.now())
                    .build();
            springDataZoneRiderRepository.save(entity);
        }
    }

    @Override
    @Transactional
    public void removeRiderFromZone(UUID idZone, UUID idRider) {
        springDataZoneRiderRepository.deleteByIdZoneAndIdRider(idZone, idRider);
    }

    @Override
    public List<UUID> findRidersByZoneId(UUID idZone) {
        return springDataZoneRiderRepository.findIdRiderByIdZone(idZone);
    }

    @Override
    public List<UUID> findZonesByRiderId(UUID idRider) {
        return springDataZoneRiderRepository.findIdZoneByIdRider(idRider);
    }

    @Override
    public boolean existsByZoneAndRider(UUID idZone, UUID idRider) {
        return springDataZoneRiderRepository.existsByIdZoneAndIdRider(idZone, idRider);
    }
}
