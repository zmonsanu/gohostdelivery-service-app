package com.zms.gohostdeliveryservice.application.command.company;

import com.zms.gohostdeliveryservice.application.dto.CompanyDto;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PartialUpdateCompanyCommandHandler {

    private final CompanyRepository companyRepository;

    public CompanyDto handle(PartialUpdateCompanyCommand command) {
        Company company = companyRepository.findById(command.getId())
                .orElseThrow(() -> new CompanyNotFoundException(command.getId()));

        if (command.getNombreComercial() != null)
            company.setNombreComercial(command.getNombreComercial());
        if (command.getRepresentanteLegal() != null)
            company.setRepresentanteLegal(command.getRepresentanteLegal());
        if (command.getDocIdentidad() != null)
            company.setDocIdentidad(command.getDocIdentidad());
        if (command.getDireccion() != null)
            company.setDireccion(command.getDireccion());
        if (command.getMunicipio() != null)
            company.setMunicipio(command.getMunicipio());
        if (command.getProvincia() != null)
            company.setProvincia(command.getProvincia());
        if (command.getTelefono() != null)
            company.setTelefono(command.getTelefono());
        if (command.getEmail() != null)
            company.setEmail(command.getEmail());
        if (command.getWeb() != null)
            company.setWeb(command.getWeb());
        if (command.getActivo() != null)
            company.setActivo(command.getActivo());

        Company saved = companyRepository.save(company);

        return toDto(saved);
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
}
