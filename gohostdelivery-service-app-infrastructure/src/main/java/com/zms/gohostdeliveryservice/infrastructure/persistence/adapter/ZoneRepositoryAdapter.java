package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.Zone;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.ZoneJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class ZoneRepositoryAdapter implements ZoneRepository {

    private final SpringDataZoneRepository springDataZoneRepository;

    @Override
    public Zone save(Zone zone) {
        return toDomain(springDataZoneRepository.save(toEntity(zone)));
    }

    @Override
    public Optional<Zone> findById(UUID id) {
        return springDataZoneRepository.findById(id).map(this::toDomain);
    }

    @Override
    public List<Zone> findAll() {
        return springDataZoneRepository.findAll().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public List<Zone> findByCompanyId(UUID companyId) {
        return springDataZoneRepository.findByIdCompany(companyId).stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public void deleteById(UUID id) {
        springDataZoneRepository.deleteById(id);
    }

    private ZoneJpaEntity toEntity(Zone zone) {
        return ZoneJpaEntity.builder()
                .idZone(zone.getIdZone())
                .idCompany(zone.getIdCompany())
                .idCity(zone.getIdCity())
                .importeZonaCentro(zone.getImporteZonaCentro())
                .importeZonaPeriferica(zone.getImporteZonaPeriferica())
                .build();
    }

    private Zone toDomain(ZoneJpaEntity entity) {
        return Zone.builder()
                .idZone(entity.getIdZone())
                .idCompany(entity.getIdCompany())
                .idCity(entity.getIdCity())
                .importeZonaCentro(entity.getImporteZonaCentro())
                .importeZonaPeriferica(entity.getImporteZonaPeriferica())
                .build();
    }
}
