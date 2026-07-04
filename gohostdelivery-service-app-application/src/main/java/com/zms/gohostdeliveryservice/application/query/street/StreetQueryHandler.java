package com.zms.gohostdeliveryservice.application.query.street;

import com.zms.gohostdeliveryservice.application.dto.StreetDto;
import com.zms.gohostdeliveryservice.domain.model.Street;
import com.zms.gohostdeliveryservice.domain.port.out.StreetRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class StreetQueryHandler {

    private final StreetRepository streetRepository;

    public List<StreetDto> listAll() {
        return streetRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<StreetDto> listByCity(UUID idCity) {
        return streetRepository.findByIdCity(idCity).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
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
