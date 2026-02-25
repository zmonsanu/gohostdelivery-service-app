package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.CompanyRiderPreference;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRiderPreferenceRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.CompanyRiderPreferenceJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataCompanyRiderPreferenceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CompanyRiderPreferenceRepositoryAdapter implements CompanyRiderPreferenceRepository {

    private final SpringDataCompanyRiderPreferenceRepository springDataRepository;

    @Override
    public CompanyRiderPreference save(CompanyRiderPreference preference) {
        CompanyRiderPreferenceJpaEntity entity = CompanyRiderPreferenceJpaEntity.builder()
                .idPreference(preference.getIdPreference())
                .idCompany(preference.getIdCompany())
                .idRider(preference.getIdRider())
                .tipoPreferencia(preference.getTipoPreferencia())
                .fechaAsignacion(preference.getFechaAsignacion())
                .build();
        return toDomain(springDataRepository.save(entity));
    }

    @Override
    public Optional<CompanyRiderPreference> findByCompanyIdAndRiderId(UUID companyId, UUID riderId) {
        return springDataRepository.findByIdCompanyAndIdRider(companyId, riderId)
                .map(this::toDomain);
    }

    @Override
    public List<CompanyRiderPreference> findByCompanyId(UUID companyId) {
        List<CompanyRiderPreferenceJpaEntity> entities = springDataRepository.findByIdCompany(companyId);
        if (entities == null)
            return java.util.Collections.emptyList();
        return entities.stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void deleteByCompanyIdAndRiderId(UUID companyId, UUID riderId) {
        springDataRepository.deleteByIdCompanyAndIdRider(companyId, riderId);
    }

    private CompanyRiderPreference toDomain(CompanyRiderPreferenceJpaEntity entity) {
        return CompanyRiderPreference.builder()
                .idPreference(entity.getIdPreference())
                .idCompany(entity.getIdCompany())
                .idRider(entity.getIdRider())
                .tipoPreferencia(entity.getTipoPreferencia())
                .fechaAsignacion(entity.getFechaAsignacion())
                .build();
    }
}
