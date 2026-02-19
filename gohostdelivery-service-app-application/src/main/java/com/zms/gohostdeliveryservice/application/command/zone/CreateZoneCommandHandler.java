package com.zms.gohostdeliveryservice.application.command.zone;

import com.zms.gohostdeliveryservice.application.dto.ZoneDto;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Zone;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CreateZoneCommandHandler {

    private final ZoneRepository zoneRepository;
    private final CompanyRepository companyRepository;

    public ZoneDto handle(CreateZoneCommand command) {
        companyRepository.findById(command.getIdCompany())
                .orElseThrow(() -> new CompanyNotFoundException(command.getIdCompany()));

        Zone zone = Zone.builder()
                .idZone(UUID.randomUUID())
                .idCompany(command.getIdCompany())
                .idCity(command.getIdCity())
                .importeZonaCentro(command.getImporteZonaCentro())
                .importeZonaPeriferica(command.getImporteZonaPeriferica())
                .build();

        Zone saved = zoneRepository.save(zone);

        return ZoneDto.builder()
                .idZone(saved.getIdZone())
                .idCompany(saved.getIdCompany())
                .idCity(saved.getIdCity())
                .importeZonaCentro(saved.getImporteZonaCentro())
                .importeZonaPeriferica(saved.getImporteZonaPeriferica())
                .build();
    }
}
