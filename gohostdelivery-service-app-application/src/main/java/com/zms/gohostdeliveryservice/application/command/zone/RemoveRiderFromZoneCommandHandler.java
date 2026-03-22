package com.zms.gohostdeliveryservice.application.command.zone;

import com.zms.gohostdeliveryservice.domain.port.out.ZoneRiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RemoveRiderFromZoneCommandHandler {

    private final ZoneRiderRepository zoneRiderRepository;

    public void handle(RemoveRiderFromZoneCommand command) {
        zoneRiderRepository.removeRiderFromZone(command.getIdZone(), command.getIdRider());
    }
}
