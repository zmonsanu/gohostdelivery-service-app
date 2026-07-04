package com.zms.gohostdeliveryservice.application.command.street;

import com.zms.gohostdeliveryservice.application.dto.StreetDto;
import com.zms.gohostdeliveryservice.domain.exception.CityNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.ZoneNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Street;
import com.zms.gohostdeliveryservice.domain.port.out.CityRepository;
import com.zms.gohostdeliveryservice.domain.port.out.StreetRepository;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CreateStreetCommandHandler {

    private final StreetRepository streetRepository;
    private final CityRepository cityRepository;
    private final ZoneRepository zoneRepository;

    public StreetDto handle(CreateStreetCommand command) {
        // Validar que la ciudad exista
        cityRepository.findById(command.getIdCity())
                .orElseThrow(() -> new CityNotFoundException(command.getIdCity()));

        // Validar que la zona exista (si es proporcionada)
        if (command.getIdZone() != null) {
            zoneRepository.findById(command.getIdZone())
                    .orElseThrow(() -> new ZoneNotFoundException(command.getIdZone()));
        }

        Street street = Street.builder()
                .id(UUID.randomUUID())
                .nombre(command.getNombre())
                .idCity(command.getIdCity())
                .idZone(command.getIdZone())
                .numMin(command.getNumMin())
                .numMax(command.getNumMax())
                .build();

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
