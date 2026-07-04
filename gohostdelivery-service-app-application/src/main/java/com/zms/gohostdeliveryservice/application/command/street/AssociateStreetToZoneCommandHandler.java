package com.zms.gohostdeliveryservice.application.command.street;

import com.zms.gohostdeliveryservice.application.dto.StreetDto;
import com.zms.gohostdeliveryservice.domain.exception.StreetNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.ZoneNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Street;
import com.zms.gohostdeliveryservice.domain.port.out.StreetRepository;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AssociateStreetToZoneCommandHandler {

    private final StreetRepository streetRepository;
    private final ZoneRepository zoneRepository;

    public StreetDto handle(AssociateStreetToZoneCommand command) {
        Street street = streetRepository.findById(command.getIdStreet())
                .orElseThrow(() -> new StreetNotFoundException(command.getIdStreet()));

        if (command.getIdZone() != null) {
            zoneRepository.findById(command.getIdZone())
                    .orElseThrow(() -> new ZoneNotFoundException(command.getIdZone()));
        }

        street.setIdZone(command.getIdZone());
        Street saved = streetRepository.save(street);

        return toDto(saved);
    }

    private StreetDto toDto(Street street) {
        return StreetDto.builder()
                .id(street.getId())
                .nombre(street.getNombre())
                .idCity(street.getIdCity())
                .idZone(street.getIdZone())
                .numMin(street.getNumMin())
                .numMax(street.getNumMax())
                .build();
    }
}
