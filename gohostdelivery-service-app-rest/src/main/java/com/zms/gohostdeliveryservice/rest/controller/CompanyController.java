package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.company.CreateCompanyCommand;
import com.zms.gohostdeliveryservice.application.command.company.CreateCompanyCommandHandler;
import com.zms.gohostdeliveryservice.application.command.company.PartialUpdateCompanyCommand;
import com.zms.gohostdeliveryservice.application.command.company.PartialUpdateCompanyCommandHandler;
import com.zms.gohostdeliveryservice.application.command.preference.AddRiderPreferenceCommand;
import com.zms.gohostdeliveryservice.application.command.preference.AddRiderPreferenceCommandHandler;
import com.zms.gohostdeliveryservice.application.command.preference.RemoveRiderPreferenceCommand;
import com.zms.gohostdeliveryservice.application.command.preference.RemoveRiderPreferenceCommandHandler;
import com.zms.gohostdeliveryservice.application.dto.CompanyDto;
import com.zms.gohostdeliveryservice.application.dto.CompanyRiderPreferenceDto;
import com.zms.gohostdeliveryservice.application.query.company.CompanyQueryHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/companies")
@RequiredArgsConstructor
public class CompanyController {

    private final CreateCompanyCommandHandler createCompanyCommandHandler;
    private final PartialUpdateCompanyCommandHandler partialUpdateCompanyCommandHandler;
    private final CompanyQueryHandler companyQueryHandler;
    private final AddRiderPreferenceCommandHandler addRiderPreferenceCommandHandler;
    private final RemoveRiderPreferenceCommandHandler removeRiderPreferenceCommandHandler;

    @PostMapping
    public ResponseEntity<CompanyDto> createCompany(@RequestBody CreateCompanyCommand command) {
        CompanyDto dto = createCompanyCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/companies/" + dto.getId())).body(dto);
    }

    @PatchMapping("/{id}")
    public ResponseEntity<CompanyDto> updateCompanyPartial(@PathVariable UUID id,
            @RequestBody PartialUpdateCompanyCommand command) {
        command.setId(id);
        return ResponseEntity.ok(partialUpdateCompanyCommandHandler.handle(command));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CompanyDto> getCompany(@PathVariable UUID id) {
        return ResponseEntity.ok(companyQueryHandler.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<CompanyDto>> listCompanies() {
        return ResponseEntity.ok(companyQueryHandler.listAll());
    }

    @GetMapping("/{companyId}/riders")
    public ResponseEntity<List<CompanyRiderPreferenceDto>> listPreferences(@PathVariable UUID companyId) {
        return ResponseEntity.ok(companyQueryHandler.listPreferencesByCompany(companyId));
    }

    @PostMapping("/{companyId}/riders")
    public ResponseEntity<CompanyRiderPreferenceDto> addPreference(
            @PathVariable UUID companyId,
            @RequestBody AddRiderPreferenceCommand command) {
        command.setCompanyId(companyId);
        CompanyRiderPreferenceDto dto = addRiderPreferenceCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/companies/" + companyId + "/riders")).body(dto);
    }

    @DeleteMapping("/{companyId}/riders/{riderId}")
    public ResponseEntity<Void> removePreference(
            @PathVariable UUID companyId,
            @PathVariable UUID riderId) {
        removeRiderPreferenceCommandHandler.handle(
                RemoveRiderPreferenceCommand.builder()
                        .companyId(companyId)
                        .riderId(riderId)
                        .build());
        return ResponseEntity.noContent().build();
    }
}
