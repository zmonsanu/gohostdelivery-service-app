package com.zms.gohostdeliveryservice.application.command.zone;

import com.zms.gohostdeliveryservice.domain.exception.ZoneNotFoundException;
import com.zms.gohostdeliveryservice.domain.port.out.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class DeleteZoneCommandHandler {

    private final ZoneRepository zoneRepository;

    public void handle(UUID id) {
        zoneRepository.findById(id)
                .orElseThrow(() -> new ZoneNotFoundException(id));
        zoneRepository.deleteById(id);
    }
}
