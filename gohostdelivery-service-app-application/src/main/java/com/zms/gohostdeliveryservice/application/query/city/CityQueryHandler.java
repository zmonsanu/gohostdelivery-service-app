package com.zms.gohostdeliveryservice.application.query.city;

import com.zms.gohostdeliveryservice.application.dto.CityDto;
import com.zms.gohostdeliveryservice.domain.model.City;
import com.zms.gohostdeliveryservice.domain.port.out.CityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CityQueryHandler {

    private final CityRepository cityRepository;

    public List<CityDto> listAll() {
        return cityRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    private CityDto toDto(City city) {
        return CityDto.builder()
                .id(city.getId())
                .nombre(city.getNombre())
                .provincia(city.getProvincia())
                .comunidadAutonoma(city.getComunidadAutonoma())
                .build();
    }
}
