package com.zms.gohostdeliveryservice.application.query.company;

import com.zms.gohostdeliveryservice.application.dto.CompanyDto;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRiderPreferenceRepository;
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
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("Application - CompanyQueryHandler")
class CompanyQueryHandlerTest {

    @Mock
    private CompanyRepository companyRepository;

    @Mock
    private CompanyRiderPreferenceRepository preferenceRepository;

    @InjectMocks
    private CompanyQueryHandler handler;

    private UUID companyId;
    private Company company;

    @BeforeEach
    void setUp() {
        companyId = UUID.randomUUID();
        company = Company.builder()
                .id(companyId)
                .nombreComercial("GoHost SL")
                .representanteLegal("Eva Torres")
                .docIdentidad("55555555E")
                .direccion("Gran Vía 1")
                .municipio("Madrid")
                .provincia("Madrid")
                .telefono("911000000")
                .email("hola@gohost.es")
                .activo(true)
                .build();
    }

    @Test
    @DisplayName("getById() devuelve CompanyDto cuando la empresa existe")
    void getById_returnsDto_whenCompanyExists() {
        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));

        CompanyDto result = handler.getById(companyId);

        assertThat(result.getId()).isEqualTo(companyId);
        assertThat(result.getNombreComercial()).isEqualTo("GoHost SL");
        assertThat(result.getEmail()).isEqualTo("hola@gohost.es");
    }

    @Test
    @DisplayName("getById() lanza CompanyNotFoundException cuando la empresa no existe")
    void getById_throwsCompanyNotFoundException_whenNotFound() {
        when(companyRepository.findById(companyId)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> handler.getById(companyId))
                .isInstanceOf(CompanyNotFoundException.class)
                .hasMessageContaining(companyId.toString());
    }

    @Test
    @DisplayName("listAll() devuelve todos las empresas mapeadas a DTOs")
    void listAll_returnsAllCompanies() {
        Company company2 = Company.builder()
                .id(UUID.randomUUID())
                .nombreComercial("OtraEmpresa SL")
                .representanteLegal("Luis Pérez")
                .docIdentidad("44444444P")
                .direccion("Calle Norte 2")
                .municipio("Barcelona")
                .provincia("Barcelona")
                .telefono("932000000")
                .email("otra@empresa.es")
                .activo(true)
                .build();

        when(companyRepository.findAll()).thenReturn(List.of(company, company2));

        List<CompanyDto> result = handler.listAll();

        assertThat(result).hasSize(2);
        assertThat(result).extracting(CompanyDto::getNombreComercial)
                .containsExactlyInAnyOrder("GoHost SL", "OtraEmpresa SL");
    }

    @Test
    @DisplayName("listAll() devuelve lista vacía si no hay empresas")
    void listAll_returnsEmptyList_whenNoCompanies() {
        when(companyRepository.findAll()).thenReturn(List.of());

        List<CompanyDto> result = handler.listAll();

        assertThat(result).isEmpty();
    }

    @Test
    @DisplayName("listPreferencesByCompany() lanza CompanyNotFoundException si la empresa no existe")
    void listPreferencesByCompany_throwsCompanyNotFoundException_whenNotFound() {
        when(companyRepository.findById(companyId)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> handler.listPreferencesByCompany(companyId))
                .isInstanceOf(CompanyNotFoundException.class);

        verify(preferenceRepository, never()).findByCompanyId(any());
    }
}
