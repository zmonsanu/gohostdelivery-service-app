package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.City;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface CityRepository {
    List<City> findAll();

    Optional<City> findById(UUID id);
}
