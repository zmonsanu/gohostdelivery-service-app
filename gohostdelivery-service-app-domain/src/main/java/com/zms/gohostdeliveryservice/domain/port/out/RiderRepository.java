package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.Rider;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface RiderRepository {
    Rider save(Rider rider);

    Optional<Rider> findById(UUID id);

    List<Rider> findAll();

    void deleteById(UUID id);

    boolean existsByEmail(String email);
}
