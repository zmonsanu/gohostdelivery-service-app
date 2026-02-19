package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.zone.CreateZoneCommand;
import com.zms.gohostdeliveryservice.application.command.zone.CreateZoneCommandHandler;
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
    private final ZoneQueryHandler zoneQueryHandler;

    @PostMapping
    public ResponseEntity<ZoneDto> createZone(@RequestBody CreateZoneCommand command) {
        ZoneDto dto = createZoneCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/zones/" + dto.getIdZone())).body(dto);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ZoneDto> getZone(@PathVariable UUID id) {
        return ResponseEntity.ok(zoneQueryHandler.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<ZoneDto>> listZones() {
        return ResponseEntity.ok(zoneQueryHandler.listAll());
    }

    @GetMapping("/company/{companyId}")
    public ResponseEntity<List<ZoneDto>> listByCompany(@PathVariable UUID companyId) {
        return ResponseEntity.ok(zoneQueryHandler.listByCompany(companyId));
    }
}
