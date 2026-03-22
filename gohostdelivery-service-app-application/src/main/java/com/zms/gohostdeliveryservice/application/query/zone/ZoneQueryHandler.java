package com.zms.gohostdeliveryservice.application.query.zone;

import com.zms.gohostdeliveryservice.application.dto.ZoneDto;
import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.domain.exception.ZoneNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Zone;
import com.zms.gohostdeliveryservice.domain.model.Rider;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRiderRepository;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.Optional;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ZoneQueryHandler {

    private final ZoneRepository zoneRepository;
    private final ZoneRiderRepository zoneRiderRepository;
    private final RiderRepository riderRepository;

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

    public List<RiderDto> getRidersByZone(UUID zoneId) {
        zoneRepository.findById(zoneId)
                .orElseThrow(() -> new ZoneNotFoundException(zoneId));

        List<UUID> riderIds = zoneRiderRepository.findRidersByZoneId(zoneId);
        
        return riderIds.stream()
                .map(riderRepository::findById)
                .flatMap(Optional::stream)
                .map(this::toRiderDto)
                .collect(Collectors.toList());
    }

    private RiderDto toRiderDto(Rider rider) {
        return RiderDto.builder()
                .id(rider.getId())
                .nombre(rider.getNombre())
                .apellido(rider.getApellido())
                .docIdentidad(rider.getDocIdentidad())
                .direccion(rider.getDireccion())
                .municipio(rider.getMunicipio())
                .provincia(rider.getProvincia())
                .telefono(rider.getTelefono())
                .email(rider.getEmail())
                .activo(rider.getActivo())
                .build();
    }
}
