package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.CompanyRiderPreferenceJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface SpringDataCompanyRiderPreferenceRepository
        extends JpaRepository<CompanyRiderPreferenceJpaEntity, UUID> {
    Optional<CompanyRiderPreferenceJpaEntity> findByIdCompanyAndIdRider(UUID idCompany, UUID idRider);

    List<CompanyRiderPreferenceJpaEntity> findByIdCompany(UUID idCompany);

    void deleteByIdCompanyAndIdRider(UUID idCompany, UUID idRider);
}
