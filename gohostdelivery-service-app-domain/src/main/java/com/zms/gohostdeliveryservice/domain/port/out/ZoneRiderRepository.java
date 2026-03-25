package com.zms.gohostdeliveryservice.domain.port.out;

import java.util.List;
import java.util.UUID;

public interface ZoneRiderRepository {
    void assignRiderToZone(UUID idZone, UUID idRider);
    void removeRiderFromZone(UUID idZone, UUID idRider);
    List<UUID> findRidersByZoneId(UUID idZone);
    List<UUID> findZonesByRiderId(UUID idRider);
    boolean existsByZoneAndRider(UUID idZone, UUID idRider);
}
