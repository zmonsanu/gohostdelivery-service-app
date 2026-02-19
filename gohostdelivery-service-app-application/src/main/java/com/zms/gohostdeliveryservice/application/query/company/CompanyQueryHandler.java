package com.zms.gohostdeliveryservice.application.query.company;

import com.zms.gohostdeliveryservice.application.dto.CompanyDto;
import com.zms.gohostdeliveryservice.application.dto.CompanyRiderPreferenceDto;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.domain.model.CompanyRiderPreference;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRiderPreferenceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CompanyQueryHandler {

    private final CompanyRepository companyRepository;
    private final CompanyRiderPreferenceRepository preferenceRepository;

    public CompanyDto getById(UUID id) {
        Company company = companyRepository.findById(id)
                .orElseThrow(() -> new CompanyNotFoundException(id));
        return toDto(company);
    }

    public List<CompanyDto> listAll() {
        return companyRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<CompanyRiderPreferenceDto> listPreferencesByCompany(UUID companyId) {
        companyRepository.findById(companyId)
                .orElseThrow(() -> new CompanyNotFoundException(companyId));
        return preferenceRepository.findByCompanyId(companyId).stream()
                .map(this::toPrefDto)
                .collect(Collectors.toList());
    }

    private CompanyDto toDto(Company company) {
        return CompanyDto.builder()
                .id(company.getId())
                .nombreComercial(company.getNombreComercial())
                .representanteLegal(company.getRepresentanteLegal())
                .docIdentidad(company.getDocIdentidad())
                .direccion(company.getDireccion())
                .municipio(company.getMunicipio())
                .provincia(company.getProvincia())
                .telefono(company.getTelefono())
                .email(company.getEmail())
                .web(company.getWeb())
                .activo(company.getActivo())
                .build();
    }

    private CompanyRiderPreferenceDto toPrefDto(CompanyRiderPreference pref) {
        return CompanyRiderPreferenceDto.builder()
                .idPreference(pref.getIdPreference())
                .idCompany(pref.getIdCompany())
                .idRider(pref.getIdRider())
                .tipoPreferencia(pref.getTipoPreferencia())
                .fechaAsignacion(pref.getFechaAsignacion())
                .build();
    }
}
