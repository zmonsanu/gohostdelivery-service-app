package com.zms.gohostdeliveryservice.infrastructure.persistence.repository;

import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.CompanyJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface SpringDataCompanyRepository extends JpaRepository<CompanyJpaEntity, UUID> {
    boolean existsByEmail(String email);
}
