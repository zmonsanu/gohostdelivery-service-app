package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.zone.AssignRiderToZoneCommand;
import com.zms.gohostdeliveryservice.application.command.zone.AssignRiderToZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.command.zone.CreateZoneCommand;
import com.zms.gohostdeliveryservice.application.command.zone.CreateZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.command.zone.RemoveRiderFromZoneCommand;
import com.zms.gohostdeliveryservice.application.command.zone.RemoveRiderFromZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.command.zone.UpdateZoneCommand;
import com.zms.gohostdeliveryservice.application.command.zone.UpdateZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.command.zone.DeleteZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.dto.ZoneDto;
import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.application.query.zone.ZoneQueryHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/zones")
@RequiredArgsConstructor
public class ZoneController {

    private final CreateZoneCommandHandler createZoneCommandHandler;
    private final UpdateZoneCommandHandler updateZoneCommandHandler;
    private final DeleteZoneCommandHandler deleteZoneCommandHandler;
    private final ZoneQueryHandler zoneQueryHandler;
    private final AssignRiderToZoneCommandHandler assignRiderToZoneCommandHandler;
    private final RemoveRiderFromZoneCommandHandler removeRiderFromZoneCommandHandler;

    @PostMapping
    public ResponseEntity<ZoneDto> createZone(@RequestBody CreateZoneCommand command) {
        ZoneDto dto = createZoneCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/zones/" + dto.getIdZone())).body(dto);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ZoneDto> updateZone(@PathVariable UUID id, @RequestBody UpdateZoneCommand command) {
        command.setIdZone(id);
        return ResponseEntity.ok(updateZoneCommandHandler.handle(command));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteZone(@PathVariable UUID id) {
        deleteZoneCommandHandler.handle(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ZoneDto> getZone(@PathVariable UUID id) {
        return ResponseEntity.ok(zoneQueryHandler.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<ZoneDto>> listZones() {
        return ResponseEntity.ok(zoneQueryHandler.listAll());
    }

    @GetMapping("/by-company/{companyId}")
    public ResponseEntity<List<ZoneDto>> listByCompany(@PathVariable UUID companyId) {
        return ResponseEntity.ok(zoneQueryHandler.listByCompany(companyId));
    }

    @PostMapping("/{id}/riders/{riderId}")
    public ResponseEntity<Void> assignRiderToZone(@PathVariable UUID id, @PathVariable UUID riderId) {
        AssignRiderToZoneCommand command = AssignRiderToZoneCommand.builder()
                .idZone(id)
                .idRider(riderId)
                .build();
        assignRiderToZoneCommandHandler.handle(command);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{id}/riders/{riderId}")
    public ResponseEntity<Void> removeRiderFromZone(@PathVariable UUID id, @PathVariable UUID riderId) {
        RemoveRiderFromZoneCommand command = RemoveRiderFromZoneCommand.builder()
                .idZone(id)
                .idRider(riderId)
                .build();
        removeRiderFromZoneCommandHandler.handle(command);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}/riders")
    public ResponseEntity<List<RiderDto>> getRidersByZone(@PathVariable UUID id) {
        return ResponseEntity.ok(zoneQueryHandler.getRidersByZone(id));
    }
}
