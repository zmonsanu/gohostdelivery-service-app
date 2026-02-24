package com.zms.gohostdeliveryservice.application.command.zone;

import com.zms.gohostdeliveryservice.application.dto.ZoneDto;
import com.zms.gohostdeliveryservice.domain.exception.ZoneNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Zone;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UpdateZoneCommandHandler {

    private final ZoneRepository zoneRepository;

    public ZoneDto handle(UpdateZoneCommand command) {
        Zone existingZone = zoneRepository.findById(command.getIdZone())
                .orElseThrow(() -> new ZoneNotFoundException(command.getIdZone()));

        existingZone.setIdCity(command.getIdCity());
        existingZone.setImporteZonaCentro(command.getImporteZonaCentro());
        existingZone.setImporteZonaPeriferica(command.getImporteZonaPeriferica());
        existingZone.setDescripcion(command.getDescripcion());

        Zone saved = zoneRepository.save(existingZone);

        return ZoneDto.builder()
                .idZone(saved.getIdZone())
                .idCompany(saved.getIdCompany())
                .idCity(saved.getIdCity())
                .importeZonaCentro(saved.getImporteZonaCentro())
                .importeZonaPeriferica(saved.getImporteZonaPeriferica())
                .descripcion(saved.getDescripcion())
                .build();
    }
}
