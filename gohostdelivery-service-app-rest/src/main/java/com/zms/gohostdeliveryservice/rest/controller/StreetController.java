package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.street.AssociateStreetToZoneCommand;
import com.zms.gohostdeliveryservice.application.command.street.AssociateStreetToZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.command.street.CreateStreetCommand;
import com.zms.gohostdeliveryservice.application.command.street.CreateStreetCommandHandler;
import com.zms.gohostdeliveryservice.application.dto.StreetDto;
import com.zms.gohostdeliveryservice.application.query.street.StreetQueryHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/streets")
@RequiredArgsConstructor
public class StreetController {

    private final CreateStreetCommandHandler createStreetCommandHandler;
    private final AssociateStreetToZoneCommandHandler associateStreetToZoneCommandHandler;
    private final StreetQueryHandler streetQueryHandler;

    @PostMapping
    public ResponseEntity<StreetDto> createStreet(@RequestBody CreateStreetCommand command) {
        StreetDto dto = createStreetCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/streets/" + dto.getId())).body(dto);
    }

    @GetMapping
    public ResponseEntity<List<StreetDto>> listStreets(@RequestParam(value = "idCity", required = false) UUID idCity) {
        if (idCity != null) {
            return ResponseEntity.ok(streetQueryHandler.listByCity(idCity));
        }
        return ResponseEntity.ok(streetQueryHandler.listAll());
    }

    @PostMapping("/{id}/associate-zone/{idZone}")
    public ResponseEntity<StreetDto> associateZone(@PathVariable UUID id, @PathVariable UUID idZone) {
        AssociateStreetToZoneCommand command = AssociateStreetToZoneCommand.builder()
                .idStreet(id)
                .idZone(idZone)
                .build();
        return ResponseEntity.ok(associateStreetToZoneCommandHandler.handle(command));
    }
}
