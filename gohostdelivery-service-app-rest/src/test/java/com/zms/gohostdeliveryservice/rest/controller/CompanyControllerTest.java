package com.zms.gohostdeliveryservice.rest.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zms.gohostdeliveryservice.application.command.company.CreateCompanyCommand;
import com.zms.gohostdeliveryservice.application.command.company.CreateCompanyCommandHandler;
import com.zms.gohostdeliveryservice.application.command.company.PartialUpdateCompanyCommandHandler;
import com.zms.gohostdeliveryservice.application.command.preference.AddRiderPreferenceCommandHandler;
import com.zms.gohostdeliveryservice.application.command.preference.RemoveRiderPreferenceCommandHandler;
import com.zms.gohostdeliveryservice.application.dto.CompanyDto;
import com.zms.gohostdeliveryservice.application.query.company.CompanyQueryHandler;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.DuplicateEmailException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;
import java.util.UUID;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(CompanyController.class)
@DisplayName("REST - CompanyController")
class CompanyControllerTest {

        @Autowired
        private MockMvc mockMvc;

        @Autowired
        private ObjectMapper objectMapper;

        @MockitoBean
        private CreateCompanyCommandHandler createCompanyCommandHandler;

        @MockitoBean
        private PartialUpdateCompanyCommandHandler partialUpdateCompanyCommandHandler;

        @MockitoBean
        private CompanyQueryHandler companyQueryHandler;

        @MockitoBean
        private AddRiderPreferenceCommandHandler addRiderPreferenceCommandHandler;

        @MockitoBean
        private RemoveRiderPreferenceCommandHandler removeRiderPreferenceCommandHandler;

        @Test
        @DisplayName("POST /companies → 201 Created cuando la empresa se crea correctamente")
        void createCompany_returns201_whenCreatedSuccessfully() throws Exception {
                CreateCompanyCommand command = CreateCompanyCommand.builder()
                                .nombreComercial("MVC Test Co")
                                .representanteLegal("Sara López")
                                .docIdentidad("22222222S")
                                .direccion("Calle Spring 8")
                                .municipio("Bilbao")
                                .provincia("Vizcaya")
                                .telefono("944000000")
                                .email("sara@mvc.es")
                                .build();

                CompanyDto dto = CompanyDto.builder()
                                .id(UUID.randomUUID())
                                .nombreComercial("MVC Test Co")
                                .representanteLegal("Sara López")
                                .docIdentidad("22222222S")
                                .direccion("Calle Spring 8")
                                .municipio("Bilbao")
                                .provincia("Vizcaya")
                                .telefono("944000000")
                                .email("sara@mvc.es")
                                .activo(true)
                                .build();

                when(createCompanyCommandHandler.handle(any())).thenReturn(dto);

                mockMvc.perform(post("/companies")
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(objectMapper.writeValueAsString(command)))
                                .andExpect(status().isCreated())
                                .andExpect(jsonPath("$.nombreComercial").value("MVC Test Co"))
                                .andExpect(jsonPath("$.email").value("sara@mvc.es"))
                                .andExpect(jsonPath("$.activo").value(true));
        }

        @Test
        @DisplayName("POST /companies → 409 Conflict cuando el email ya existe")
        void createCompany_returns409_whenEmailDuplicated() throws Exception {
                CreateCompanyCommand command = CreateCompanyCommand.builder()
                                .nombreComercial("Duplicado SL")
                                .representanteLegal("Luis Dupl")
                                .docIdentidad("11112222D")
                                .direccion("Calle Dup 1")
                                .municipio("Madrid")
                                .provincia("Madrid")
                                .telefono("911111111")
                                .email("dup@dup.es")
                                .build();

                when(createCompanyCommandHandler.handle(any()))
                                .thenThrow(new DuplicateEmailException("dup@dup.es"));

                mockMvc.perform(post("/companies")
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(objectMapper.writeValueAsString(command)))
                                .andExpect(status().isConflict())
                                .andExpect(jsonPath("$.status").value(409));
        }

        @Test
        @DisplayName("GET /companies/{id} → 200 OK con datos de la empresa")
        void getCompany_returns200_whenFound() throws Exception {
                UUID companyId = UUID.randomUUID();
                CompanyDto dto = CompanyDto.builder()
                                .id(companyId)
                                .nombreComercial("GoHost SL")
                                .representanteLegal("Jorge F")
                                .docIdentidad("77777777J")
                                .direccion("Gran Vía 50")
                                .municipio("Madrid")
                                .provincia("Madrid")
                                .telefono("915000000")
                                .email("jorge@gohost.es")
                                .activo(true)
                                .build();

                when(companyQueryHandler.getById(companyId)).thenReturn(dto);

                mockMvc.perform(get("/companies/{id}", companyId))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$.id").value(companyId.toString()))
                                .andExpect(jsonPath("$.nombreComercial").value("GoHost SL"));
        }

        @Test
        @DisplayName("GET /companies/{id} → 404 Not Found cuando la empresa no existe")
        void getCompany_returns404_whenNotFound() throws Exception {
                UUID companyId = UUID.randomUUID();
                when(companyQueryHandler.getById(companyId))
                                .thenThrow(new CompanyNotFoundException(companyId));

                mockMvc.perform(get("/companies/{id}", companyId))
                                .andExpect(status().isNotFound())
                                .andExpect(jsonPath("$.status").value(404));
        }

        @Test
        @DisplayName("GET /companies → 200 OK con lista de empresas")
        void listCompanies_returns200_withList() throws Exception {
                CompanyDto dto1 = CompanyDto.builder()
                                .id(UUID.randomUUID()).nombreComercial("Empresa A")
                                .representanteLegal("A").docIdentidad("A").direccion("A")
                                .municipio("A").provincia("A").telefono("A").email("a@a.es").activo(true).build();
                CompanyDto dto2 = CompanyDto.builder()
                                .id(UUID.randomUUID()).nombreComercial("Empresa B")
                                .representanteLegal("B").docIdentidad("B").direccion("B")
                                .municipio("B").provincia("B").telefono("B").email("b@b.es").activo(true).build();

                when(companyQueryHandler.listAll()).thenReturn(List.of(dto1, dto2));

                mockMvc.perform(get("/companies"))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$.length()").value(2));
        }
}
