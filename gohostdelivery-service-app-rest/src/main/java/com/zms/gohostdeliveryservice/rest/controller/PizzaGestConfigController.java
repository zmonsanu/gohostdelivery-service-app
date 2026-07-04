package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.domain.port.PizzaGestSchedulerControl;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/pizzagest/scheduler")
@RequiredArgsConstructor
public class PizzaGestConfigController {

    private final PizzaGestSchedulerControl pizzaGestSchedulerControl;

    @GetMapping
    public ResponseEntity<SchedulerStatusResponse> getStatus() {
        return ResponseEntity.ok(new SchedulerStatusResponse(pizzaGestSchedulerControl.isActive()));
    }

    @PostMapping
    public ResponseEntity<SchedulerStatusResponse> setStatus(@RequestBody SchedulerStatusRequest request) {
        pizzaGestSchedulerControl.setActive(request.isActive());
        return ResponseEntity.ok(new SchedulerStatusResponse(pizzaGestSchedulerControl.isActive()));
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SchedulerStatusResponse {
        private boolean active;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SchedulerStatusRequest {
        private boolean active;
    }
}
