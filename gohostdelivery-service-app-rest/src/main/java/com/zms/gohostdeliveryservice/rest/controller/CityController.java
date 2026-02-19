package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.dto.CityDto;
import com.zms.gohostdeliveryservice.application.query.city.CityQueryHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cities")
@RequiredArgsConstructor
public class CityController {

    private final CityQueryHandler cityQueryHandler;

    @GetMapping
    public ResponseEntity<List<CityDto>> listCities() {
        return ResponseEntity.ok(cityQueryHandler.listAll());
    }
}
