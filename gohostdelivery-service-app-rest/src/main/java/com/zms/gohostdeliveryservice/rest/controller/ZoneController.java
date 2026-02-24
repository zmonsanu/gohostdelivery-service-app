package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.zone.CreateZoneCommand;
import com.zms.gohostdeliveryservice.application.command.zone.CreateZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.command.zone.UpdateZoneCommand;
import com.zms.gohostdeliveryservice.application.command.zone.UpdateZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.command.zone.DeleteZoneCommandHandler;
import com.zms.gohostdeliveryservice.application.dto.ZoneDto;
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
}
