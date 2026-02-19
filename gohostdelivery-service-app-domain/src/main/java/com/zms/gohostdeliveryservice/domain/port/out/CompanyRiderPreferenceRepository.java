package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.CompanyRiderPreference;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface CompanyRiderPreferenceRepository {
    CompanyRiderPreference save(CompanyRiderPreference preference);

    Optional<CompanyRiderPreference> findByCompanyIdAndRiderId(UUID companyId, UUID riderId);

    List<CompanyRiderPreference> findByCompanyId(UUID companyId);

    void deleteByCompanyIdAndRiderId(UUID companyId, UUID riderId);
}
