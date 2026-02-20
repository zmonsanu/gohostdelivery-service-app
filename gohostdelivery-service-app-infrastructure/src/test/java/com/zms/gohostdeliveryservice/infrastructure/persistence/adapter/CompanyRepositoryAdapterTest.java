package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.CompanyJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataCompanyRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("Infrastructure - CompanyRepositoryAdapter")
class CompanyRepositoryAdapterTest {

    @Mock
    private SpringDataCompanyRepository springDataCompanyRepository;

    @InjectMocks
    private CompanyRepositoryAdapter adapter;

    private UUID id;
    private CompanyJpaEntity entity;
    private Company domain;

    @BeforeEach
    void setUp() {
        id = UUID.randomUUID();

        entity = CompanyJpaEntity.builder()
                .id(id)
                .nombreComercial("Adapter Test Co")
                .representanteLegal("Ana Ruiz")
                .docIdentidad("33333333A")
                .direccion("Calle Java 42")
                .municipio("Madrid")
                .provincia("Madrid")
                .telefono("600000042")
                .email("adapter@test.com")
                .web("https://adapter.test")
                .activo(true)
                .build();

        domain = Company.builder()
                .id(id)
                .nombreComercial("Adapter Test Co")
                .representanteLegal("Ana Ruiz")
                .docIdentidad("33333333A")
                .direccion("Calle Java 42")
                .municipio("Madrid")
                .provincia("Madrid")
                .telefono("600000042")
                .email("adapter@test.com")
                .web("https://adapter.test")
                .activo(true)
                .build();
    }

    @Test
    @DisplayName("save() persiste y devuelve la empresa como dominio")
    void save_persistsAndReturnsDomain() {
        when(springDataCompanyRepository.save(any(CompanyJpaEntity.class))).thenReturn(entity);

        Company result = adapter.save(domain);

        assertThat(result.getId()).isEqualTo(id);
        assertThat(result.getNombreComercial()).isEqualTo("Adapter Test Co");
        assertThat(result.getEmail()).isEqualTo("adapter@test.com");
        assertThat(result.getActivo()).isTrue();
        verify(springDataCompanyRepository).save(any(CompanyJpaEntity.class));
    }

    @Test
    @DisplayName("findById() devuelve Optional con la empresa si existe")
    void findById_returnsOptionalWithCompany_whenFound() {
        when(springDataCompanyRepository.findById(id)).thenReturn(Optional.of(entity));

        Optional<Company> result = adapter.findById(id);

        assertThat(result).isPresent();
        assertThat(result.get().getId()).isEqualTo(id);
        assertThat(result.get().getEmail()).isEqualTo("adapter@test.com");
    }

    @Test
    @DisplayName("findById() devuelve Optional vacío si la empresa no existe")
    void findById_returnsEmpty_whenNotFound() {
        when(springDataCompanyRepository.findById(id)).thenReturn(Optional.empty());

        Optional<Company> result = adapter.findById(id);

        assertThat(result).isEmpty();
    }

    @Test
    @DisplayName("findAll() devuelve todas las empresas mapeadas a dominio")
    void findAll_returnsMappedDomainList() {
        when(springDataCompanyRepository.findAll()).thenReturn(List.of(entity));

        List<Company> result = adapter.findAll();

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getNombreComercial()).isEqualTo("Adapter Test Co");
    }

    @Test
    @DisplayName("existsByEmail() delega en SpringDataRepository")
    void existsByEmail_delegatesToSpringData() {
        when(springDataCompanyRepository.existsByEmail("adapter@test.com")).thenReturn(true);

        boolean result = adapter.existsByEmail("adapter@test.com");

        assertThat(result).isTrue();
        verify(springDataCompanyRepository).existsByEmail("adapter@test.com");
    }

    @Test
    @DisplayName("deleteById() delega en SpringDataRepository")
    void deleteById_delegatesToSpringData() {
        doNothing().when(springDataCompanyRepository).deleteById(id);

        adapter.deleteById(id);

        verify(springDataCompanyRepository).deleteById(id);
    }
}
