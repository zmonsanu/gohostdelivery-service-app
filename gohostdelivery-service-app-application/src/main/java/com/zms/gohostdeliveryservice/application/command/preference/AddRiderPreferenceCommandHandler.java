package com.zms.gohostdeliveryservice.application.command.preference;

import com.zms.gohostdeliveryservice.application.dto.CompanyRiderPreferenceDto;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.CompanyRiderPreference;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRiderPreferenceRepository;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AddRiderPreferenceCommandHandler {

    private final CompanyRiderPreferenceRepository preferenceRepository;
    private final CompanyRepository companyRepository;
    private final RiderRepository riderRepository;

    public CompanyRiderPreferenceDto handle(AddRiderPreferenceCommand command) {
        companyRepository.findById(command.getCompanyId())
                .orElseThrow(() -> new CompanyNotFoundException(command.getCompanyId()));
        riderRepository.findById(command.getRiderId())
                .orElseThrow(() -> new RiderNotFoundException(command.getRiderId()));

        CompanyRiderPreference preference = CompanyRiderPreference.builder()
                .idPreference(UUID.randomUUID())
                .idCompany(command.getCompanyId())
                .idRider(command.getRiderId())
                .tipoPreferencia(command.getTipoPreferencia())
                .fechaAsignacion(LocalDateTime.now())
                .build();

        CompanyRiderPreference saved = preferenceRepository.save(preference);

        return CompanyRiderPreferenceDto.builder()
                .idPreference(saved.getIdPreference())
                .idCompany(saved.getIdCompany())
                .idRider(saved.getIdRider())
                .tipoPreferencia(saved.getTipoPreferencia())
                .fechaAsignacion(saved.getFechaAsignacion())
                .build();
    }
}
