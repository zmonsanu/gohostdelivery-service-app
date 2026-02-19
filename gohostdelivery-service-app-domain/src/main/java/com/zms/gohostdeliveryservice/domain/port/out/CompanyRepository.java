package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.Company;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface CompanyRepository {
    Company save(Company company);

    Optional<Company> findById(UUID id);

    List<Company> findAll();

    void deleteById(UUID id);

    boolean existsByEmail(String email);
}
