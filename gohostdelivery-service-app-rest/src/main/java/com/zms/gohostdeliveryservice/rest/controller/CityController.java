package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.dto.CityDto;
import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.application.query.city.CityQueryHandler;
import com.zms.gohostdeliveryservice.application.query.rider.RiderQueryHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/cities")
@RequiredArgsConstructor
public class CityController {

    private final CityQueryHandler cityQueryHandler;
    private final RiderQueryHandler riderQueryHandler;

    @GetMapping
    public ResponseEntity<List<CityDto>> listCities() {
        return ResponseEntity.ok(cityQueryHandler.listAll());
    }

    @GetMapping("/{cityId}/riders")
    public ResponseEntity<List<RiderDto>> getRidersByCity(@PathVariable UUID cityId) {
        return ResponseEntity.ok(riderQueryHandler.getRidersByCity(cityId));
    }
}
