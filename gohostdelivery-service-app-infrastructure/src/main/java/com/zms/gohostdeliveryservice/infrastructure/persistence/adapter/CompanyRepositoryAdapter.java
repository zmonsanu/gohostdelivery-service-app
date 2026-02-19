package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.CompanyJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataCompanyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CompanyRepositoryAdapter implements CompanyRepository {

    private final SpringDataCompanyRepository springDataCompanyRepository;

    @Override
    public Company save(Company company) {
        return toDomain(springDataCompanyRepository.save(toEntity(company)));
    }

    @Override
    public Optional<Company> findById(UUID id) {
        return springDataCompanyRepository.findById(id).map(this::toDomain);
    }

    @Override
    public List<Company> findAll() {
        return springDataCompanyRepository.findAll().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public void deleteById(UUID id) {
        springDataCompanyRepository.deleteById(id);
    }

    @Override
    public boolean existsByEmail(String email) {
        return springDataCompanyRepository.existsByEmail(email);
    }

    private CompanyJpaEntity toEntity(Company company) {
        return CompanyJpaEntity.builder()
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

    private Company toDomain(CompanyJpaEntity entity) {
        return Company.builder()
                .id(entity.getId())
                .nombreComercial(entity.getNombreComercial())
                .representanteLegal(entity.getRepresentanteLegal())
                .docIdentidad(entity.getDocIdentidad())
                .direccion(entity.getDireccion())
                .municipio(entity.getMunicipio())
                .provincia(entity.getProvincia())
                .telefono(entity.getTelefono())
                .email(entity.getEmail())
                .web(entity.getWeb())
                .activo(entity.getActivo())
                .build();
    }
}
