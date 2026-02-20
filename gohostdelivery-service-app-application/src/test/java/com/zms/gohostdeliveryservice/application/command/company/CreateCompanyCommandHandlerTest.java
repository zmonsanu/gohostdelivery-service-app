package com.zms.gohostdeliveryservice.application.command.company;

import com.zms.gohostdeliveryservice.application.dto.CompanyDto;
import com.zms.gohostdeliveryservice.domain.exception.DuplicateEmailException;
import com.zms.gohostdeliveryservice.domain.model.Company;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.UUID;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("Application - CreateCompanyCommandHandler")
class CreateCompanyCommandHandlerTest {

    @Mock
    private CompanyRepository companyRepository;

    @InjectMocks
    private CreateCompanyCommandHandler handler;

    private CreateCompanyCommand command;

    @BeforeEach
    void setUp() {
        command = CreateCompanyCommand.builder()
                .nombreComercial("Transportes GoHost")
                .representanteLegal("Pedro Martínez")
                .docIdentidad("87654321B")
                .direccion("Calle Falsa 123")
                .municipio("Sevilla")
                .provincia("Sevilla")
                .telefono("654321987")
                .email("gohost@email.com")
                .web("https://gohost.com")
                .build();
    }

    @Test
    @DisplayName("handle() crea y devuelve CompanyDto cuando el email no está duplicado")
    void handle_createsCompany_whenEmailNotDuplicated() {
        Company savedCompany = Company.builder()
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

        when(companyRepository.existsByEmail(command.getEmail())).thenReturn(false);
        when(companyRepository.save(any(Company.class))).thenReturn(savedCompany);

        CompanyDto result = handler.handle(command);

        assertThat(result).isNotNull();
        assertThat(result.getNombreComercial()).isEqualTo("Transportes GoHost");
        assertThat(result.getEmail()).isEqualTo("gohost@email.com");
        assertThat(result.getActivo()).isTrue();
        verify(companyRepository).save(any(Company.class));
    }

    @Test
    @DisplayName("handle() lanza DuplicateEmailException cuando el email ya existe")
    void handle_throwsDuplicateEmailException_whenEmailExists() {
        when(companyRepository.existsByEmail(command.getEmail())).thenReturn(true);

        assertThatThrownBy(() -> handler.handle(command))
                .isInstanceOf(DuplicateEmailException.class)
                .hasMessageContaining(command.getEmail());

        verify(companyRepository, never()).save(any());
    }

    @Test
    @DisplayName("handle() genera un UUID nuevo para la empresa creada")
    void handle_generatesNewUuid_forCreatedCompany() {
        Company savedCompany = Company.builder()
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

        when(companyRepository.existsByEmail(any())).thenReturn(false);
        when(companyRepository.save(any())).thenReturn(savedCompany);

        CompanyDto result = handler.handle(command);

        assertThat(result.getId()).isNotNull();
    }
}
