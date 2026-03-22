package com.zms.gohostdeliveryservice.application.command.zone;

import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.ZoneNotFoundException;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AssignRiderToZoneCommandHandler {

    private final ZoneRepository zoneRepository;
    private final RiderRepository riderRepository;
    private final ZoneRiderRepository zoneRiderRepository;

    public void handle(AssignRiderToZoneCommand command) {
        zoneRepository.findById(command.getIdZone())
                .orElseThrow(() -> new ZoneNotFoundException(command.getIdZone()));

        riderRepository.findById(command.getIdRider())
                .orElseThrow(() -> new RiderNotFoundException(command.getIdRider()));

        if (!zoneRiderRepository.existsByZoneAndRider(command.getIdZone(), command.getIdRider())) {
            zoneRiderRepository.assignRiderToZone(command.getIdZone(), command.getIdRider());
        }
    }
}
