package com.zms.gohostdeliveryservice.domain.model;

import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.DuplicateEmailException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.UUID;

import static org.assertj.core.api.Assertions.*;

@DisplayName("Domain - Company model y excepciones")
class CompanyTest {

    @Test
    @DisplayName("Company.builder() crea la entidad con todos los campos correctamente")
    void company_builder_setsAllFields() {
        UUID id = UUID.randomUUID();

        Company company = Company.builder()
                .id(id)
                .nombreComercial("Transportes XYZ")
                .representanteLegal("Juan García")
                .docIdentidad("12345678A")
                .direccion("Calle Mayor 1")
                .municipio("Madrid")
                .provincia("Madrid")
                .telefono("600000001")
                .email("empresa@xyz.com")
                .web("https://xyz.com")
                .activo(true)
                .build();

        assertThat(company.getId()).isEqualTo(id);
        assertThat(company.getNombreComercial()).isEqualTo("Transportes XYZ");
        assertThat(company.getRepresentanteLegal()).isEqualTo("Juan García");
        assertThat(company.getDocIdentidad()).isEqualTo("12345678A");
        assertThat(company.getDireccion()).isEqualTo("Calle Mayor 1");
        assertThat(company.getMunicipio()).isEqualTo("Madrid");
        assertThat(company.getProvincia()).isEqualTo("Madrid");
        assertThat(company.getTelefono()).isEqualTo("600000001");
        assertThat(company.getEmail()).isEqualTo("empresa@xyz.com");
        assertThat(company.getWeb()).isEqualTo("https://xyz.com");
        assertThat(company.getActivo()).isTrue();
    }

    @Test
    @DisplayName("CompanyNotFoundException contiene el mensaje correcto con el UUID")
    void companyNotFoundException_containsUuid() {
        UUID id = UUID.randomUUID();
        CompanyNotFoundException ex = new CompanyNotFoundException(id);
        assertThat(ex.getMessage()).contains(id.toString());
    }

    @Test
    @DisplayName("DuplicateEmailException contiene el email en el mensaje")
    void duplicateEmailException_containsEmail() {
        String email = "test@test.com";
        DuplicateEmailException ex = new DuplicateEmailException(email);
        assertThat(ex.getMessage()).contains(email);
    }
}
