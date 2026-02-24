package com.zms.gohostdeliveryservice.application.query.zone;

import com.zms.gohostdeliveryservice.application.dto.ZoneDto;
import com.zms.gohostdeliveryservice.domain.exception.ZoneNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Zone;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ZoneQueryHandler {

    private final ZoneRepository zoneRepository;

    public ZoneDto getById(UUID id) {
        Zone zone = zoneRepository.findById(id)
                .orElseThrow(() -> new ZoneNotFoundException(id));
        return toDto(zone);
    }

    public List<ZoneDto> listAll() {
        return zoneRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<ZoneDto> listByCompany(UUID companyId) {
        List<Zone> zones = zoneRepository.findByCompanyId(companyId);
        if (zones == null) {
            return java.util.Collections.emptyList();
        }
        return zones.stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    private ZoneDto toDto(Zone zone) {
        return ZoneDto.builder()
                .idZone(zone.getIdZone())
                .idCompany(zone.getIdCompany())
                .idCity(zone.getIdCity())
                .importeZonaCentro(zone.getImporteZonaCentro())
                .importeZonaPeriferica(zone.getImporteZonaPeriferica())
                .descripcion(zone.getDescripcion())
                .build();
    }
}
