package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.Rider;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.RiderJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataRiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class RiderRepositoryAdapter implements RiderRepository {

    private final SpringDataRiderRepository springDataRiderRepository;

    @Override
    public Rider save(Rider rider) {
        RiderJpaEntity entity = toEntity(rider);
        return toDomain(springDataRiderRepository.save(entity));
    }

    @Override
    public Optional<Rider> findById(UUID id) {
        return springDataRiderRepository.findById(id).map(this::toDomain);
    }

    @Override
    public List<Rider> findAll() {
        return springDataRiderRepository.findAll().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public void deleteById(UUID id) {
        springDataRiderRepository.deleteById(id);
    }

    @Override
    public boolean existsByEmail(String email) {
        return springDataRiderRepository.existsByEmail(email);
    }

    private RiderJpaEntity toEntity(Rider rider) {
        return RiderJpaEntity.builder()
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

    private Rider toDomain(RiderJpaEntity entity) {
        return Rider.builder()
                .id(entity.getId())
                .nombre(entity.getNombre())
                .apellido(entity.getApellido())
                .docIdentidad(entity.getDocIdentidad())
                .direccion(entity.getDireccion())
                .municipio(entity.getMunicipio())
                .provincia(entity.getProvincia())
                .telefono(entity.getTelefono())
                .email(entity.getEmail())
                .activo(entity.getActivo())
                .build();
    }
}
