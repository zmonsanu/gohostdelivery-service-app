package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.document.DeleteRiderDocumentCommandHandler;
import com.zms.gohostdeliveryservice.application.command.document.UploadRiderDocumentCommandHandler;
import com.zms.gohostdeliveryservice.application.command.rider.CreateRiderCommandHandler;
import com.zms.gohostdeliveryservice.application.command.rider.PartialUpdateRiderCommandHandler;
import com.zms.gohostdeliveryservice.application.dto.ZoneDto;
import com.zms.gohostdeliveryservice.application.query.document.RiderDocumentQueryHandler;
import com.zms.gohostdeliveryservice.application.query.rider.RiderQueryHandler;
import com.zms.gohostdeliveryservice.application.query.zone.ZoneQueryHandler;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(RiderController.class)
@DisplayName("REST - RiderController")
class RiderControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private CreateRiderCommandHandler createRiderCommandHandler;

    @MockitoBean
    private PartialUpdateRiderCommandHandler partialUpdateRiderCommandHandler;

    @MockitoBean
    private RiderQueryHandler riderQueryHandler;

    @MockitoBean
    private UploadRiderDocumentCommandHandler uploadRiderDocumentCommandHandler;

    @MockitoBean
    private DeleteRiderDocumentCommandHandler deleteRiderDocumentCommandHandler;

    @MockitoBean
    private RiderDocumentQueryHandler riderDocumentQueryHandler;

    @MockitoBean
    private ZoneQueryHandler zoneQueryHandler;

    @Test
    @DisplayName("GET /riders/{riderId}/zones → 200 OK con lista de zonas")
    void getZonesByRider_returns200_withList() throws Exception {
        UUID riderId = UUID.randomUUID();
        ZoneDto zone1 = ZoneDto.builder()
                .idZone(UUID.randomUUID())
                .descripcion("Zona Norte")
                .importeZonaCentro(new BigDecimal("5.00"))
                .importeZonaPeriferica(new BigDecimal("7.00"))
                .build();
        ZoneDto zone2 = ZoneDto.builder()
                .idZone(UUID.randomUUID())
                .descripcion("Zona Sur")
                .importeZonaCentro(new BigDecimal("4.00"))
                .importeZonaPeriferica(new BigDecimal("6.00"))
                .build();

        when(zoneQueryHandler.getZonesByRider(riderId)).thenReturn(List.of(zone1, zone2));

        mockMvc.perform(get("/riders/{riderId}/zones", riderId)
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(2))
                .andExpect(jsonPath("$[0].descripcion").value("Zona Norte"))
                .andExpect(jsonPath("$[1].descripcion").value("Zona Sur"));
    }
}
