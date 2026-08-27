package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.dto.CityDto;
import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.application.query.city.CityQueryHandler;
import com.zms.gohostdeliveryservice.application.query.rider.RiderQueryHandler;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;
import java.util.UUID;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(CityController.class)
@DisplayName("REST - CityController")
class CityControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private CityQueryHandler cityQueryHandler;

    @MockitoBean
    private RiderQueryHandler riderQueryHandler;

    @Test
    @DisplayName("GET /cities → 200 OK con lista de ciudades")
    void listCities_returns200_withList() throws Exception {
        CityDto city = CityDto.builder()
                .id(UUID.randomUUID())
                .nombre("Las Palmas de Gran Canaria")
                .provincia("Las Palmas")
                .comunidadAutonoma("Canarias")
                .build();

        when(cityQueryHandler.listAll()).thenReturn(List.of(city));

        mockMvc.perform(get("/cities")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(1))
                .andExpect(jsonPath("$[0].nombre").value("Las Palmas de Gran Canaria"));
    }

    @Test
    @DisplayName("GET /cities/{cityId}/riders → 200 OK con lista de riders")
    void getRidersByCity_returns200_withList() throws Exception {
        UUID cityId = UUID.randomUUID();
        RiderDto rider = RiderDto.builder()
                .id(UUID.randomUUID())
                .nombre("Juan")
                .apellido("Pérez")
                .activo(true)
                .build();

        when(riderQueryHandler.getRidersByCity(cityId)).thenReturn(List.of(rider));

        mockMvc.perform(get("/cities/{cityId}/riders", cityId)
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(1))
                .andExpect(jsonPath("$[0].nombre").value("Juan"))
                .andExpect(jsonPath("$[0].apellido").value("Pérez"));
    }
}
