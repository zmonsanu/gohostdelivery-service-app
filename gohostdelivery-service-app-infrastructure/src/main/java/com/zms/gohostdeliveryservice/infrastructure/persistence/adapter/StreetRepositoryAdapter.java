package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.Street;
import com.zms.gohostdeliveryservice.domain.port.out.StreetRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.StreetJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataStreetRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class StreetRepositoryAdapter implements StreetRepository {

    private final SpringDataStreetRepository springDataStreetRepository;

    @Override
    public Street save(Street street) {
        return toDomain(springDataStreetRepository.save(toEntity(street)));
    }

    @Override
    public Optional<Street> findById(UUID id) {
        return springDataStreetRepository.findById(id).map(this::toDomain);
    }

    @Override
    public List<Street> findAll() {
        return springDataStreetRepository.findAll().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public List<Street> findByIdCity(UUID idCity) {
        return springDataStreetRepository.findByIdCity(idCity).stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public List<Street> findByIdZone(UUID idZone) {
        return springDataStreetRepository.findByIdZone(idZone).stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public void deleteById(UUID id) {
        springDataStreetRepository.deleteById(id);
    }

    private StreetJpaEntity toEntity(Street street) {
        return StreetJpaEntity.builder()
                .id(street.getId())
                .nombre(street.getNombre())
                .idCity(street.getIdCity())
                .idZone(street.getIdZone())
                .numMin(street.getNumMin())
                .numMax(street.getNumMax())
                .build();
    }

    private Street toDomain(StreetJpaEntity entity) {
        return Street.builder()
                .id(entity.getId())
                .nombre(entity.getNombre())
                .idCity(entity.getIdCity())
                .idZone(entity.getIdZone())
                .numMin(entity.getNumMin())
                .numMax(entity.getNumMax())
                .build();
    }
}
