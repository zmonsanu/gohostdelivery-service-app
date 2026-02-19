package com.zms.gohostdeliveryservice.application.command.company;

import com.zms.gohostdeliveryservice.application.dto.CompanyDto;
import com.zms.gohostdeliveryservice.domain.exception.DuplicateEmailException;
import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CreateCompanyCommandHandler {

    private final CompanyRepository companyRepository;

    public CompanyDto handle(CreateCompanyCommand command) {
        if (companyRepository.existsByEmail(command.getEmail())) {
            throw new DuplicateEmailException(command.getEmail());
        }

        Company company = Company.builder()
                .id(UUID.randomUUID())
                .nombreComercial(command.getNombreComercial())
                .representanteLegal(command.getRepresentanteLegal())
                .docIdentidad(command.getDocIdentidad())
                .direccion(command.getDireccion())
                .municipio(command.getMunicipio())
                .provincia(command.getProvincia())
                .telefono(command.getTelefono())
                .email(command.getEmail())
                .web(command.getWeb())
                .activo(true)
                .build();

        Company saved = companyRepository.save(company);

        return CompanyDto.builder()
                .id(saved.getId())
                .nombreComercial(saved.getNombreComercial())
                .representanteLegal(saved.getRepresentanteLegal())
                .docIdentidad(saved.getDocIdentidad())
                .direccion(saved.getDireccion())
                .municipio(saved.getMunicipio())
                .provincia(saved.getProvincia())
                .telefono(saved.getTelefono())
                .email(saved.getEmail())
                .web(saved.getWeb())
                .activo(saved.getActivo())
                .build();
    }
}
