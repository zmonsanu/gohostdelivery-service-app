package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.City;
import com.zms.gohostdeliveryservice.domain.port.out.CityRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.CityJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataCityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CityRepositoryAdapter implements CityRepository {

    private final SpringDataCityRepository springDataCityRepository;

    @Override
    public List<City> findAll() {
        return springDataCityRepository.findAll().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public Optional<City> findById(UUID id) {
        return springDataCityRepository.findById(id).map(this::toDomain);
    }

    private City toDomain(CityJpaEntity entity) {
        return City.builder()
                .id(entity.getId())
                .nombre(entity.getNombre())
                .provincia(entity.getProvincia())
                .comunidadAutonoma(entity.getComunidadAutonoma())
                .build();
    }
}
