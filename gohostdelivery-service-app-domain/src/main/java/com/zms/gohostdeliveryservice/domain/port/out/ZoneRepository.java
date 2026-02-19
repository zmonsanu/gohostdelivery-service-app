package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.Zone;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ZoneRepository {
    Zone save(Zone zone);

    Optional<Zone> findById(UUID id);

    List<Zone> findAll();

    List<Zone> findByCompanyId(UUID companyId);

    void deleteById(UUID id);
}
