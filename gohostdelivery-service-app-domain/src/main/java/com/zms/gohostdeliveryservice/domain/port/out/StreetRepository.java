package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.Street;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface StreetRepository {
    Street save(Street street);
    Optional<Street> findById(UUID id);
    List<Street> findAll();
    List<Street> findByIdCity(UUID idCity);
    List<Street> findByIdZone(UUID idZone);
    void deleteById(UUID id);
}
