package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.order.*;
import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.application.query.order.OrderQueryHandler;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
public class OrderController {

    private final CreateOrderCommandHandler createOrderCommandHandler;
    private final AssignRiderToOrderCommandHandler assignRiderToOrderCommandHandler;
    private final UpdateOrderStatusCommandHandler updateOrderStatusCommandHandler;
    private final DeliverOrderCommandHandler deliverOrderCommandHandler;
    private final OrderQueryHandler orderQueryHandler;

    @PostMapping
    public ResponseEntity<OrderDto> createOrder(@RequestBody CreateOrderCommand command) {
        OrderDto dto = createOrderCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/orders/" + dto.getIdPedido())).body(dto);
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderDto> getOrder(@PathVariable UUID id) {
        return ResponseEntity.ok(orderQueryHandler.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<OrderDto>> listOrders(
            @RequestParam(required = false) OrderStatus estado,
            @RequestParam(required = false) UUID companyId,
            @RequestParam(required = false) UUID riderId,
            @RequestParam(required = false) UUID zoneId,
            @RequestParam(required = false) @org.springframework.format.annotation.DateTimeFormat(iso = org.springframework.format.annotation.DateTimeFormat.ISO.DATE_TIME) java.time.LocalDateTime desde,
            @RequestParam(required = false) @org.springframework.format.annotation.DateTimeFormat(iso = org.springframework.format.annotation.DateTimeFormat.ISO.DATE_TIME) java.time.LocalDateTime hasta) {

        if (estado != null || companyId != null || riderId != null || zoneId != null || desde != null
                || hasta != null) {
            return ResponseEntity.ok(orderQueryHandler.listByFilters(companyId, riderId, zoneId, estado, desde, hasta));
        }
        return ResponseEntity.ok(orderQueryHandler.listAll());
    }

    @GetMapping("/company/{companyId}")
    public ResponseEntity<List<OrderDto>> listByCompany(@PathVariable UUID companyId) {
        return ResponseEntity.ok(orderQueryHandler.listByCompany(companyId));
    }

    @GetMapping("/rider/{riderId}")
    public ResponseEntity<List<OrderDto>> listByRider(@PathVariable UUID riderId) {
        return ResponseEntity.ok(orderQueryHandler.listByRider(riderId));
    }

    @PutMapping("/{orderId}/assign-rider")
    public ResponseEntity<OrderDto> assignRider(
            @PathVariable UUID orderId,
            @RequestBody AssignRiderToOrderCommand command) {
        command.setOrderId(orderId);
        return ResponseEntity.ok(assignRiderToOrderCommandHandler.handle(command));
    }

    @PutMapping("/{orderId}/status")
    public ResponseEntity<OrderDto> updateStatus(
            @PathVariable UUID orderId,
            @RequestBody UpdateOrderStatusCommand command) {
        command.setOrderId(orderId);
        return ResponseEntity.ok(updateOrderStatusCommandHandler.handle(command));
    }

    @PutMapping("/{orderId}/deliver")
    public ResponseEntity<OrderDto> deliver(
            @PathVariable UUID orderId,
            @RequestBody DeliverOrderCommand command) {
        command.setOrderId(orderId);
        return ResponseEntity.ok(deliverOrderCommandHandler.handle(command));
    }
}
