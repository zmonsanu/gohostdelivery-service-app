package com.zms.gohostdeliveryservice.application.query.order;

import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.domain.exception.OrderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrderQueryHandler {

    private final OrderRepository orderRepository;

    public OrderDto getById(UUID id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new OrderNotFoundException(id));
        return toDto(order);
    }

    public List<OrderDto> listAll() {
        return orderRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<OrderDto> listByCompany(UUID companyId) {
        return orderRepository.findByCompanyId(companyId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<OrderDto> listByRider(UUID riderId) {
        return orderRepository.findByRiderId(riderId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<OrderDto> listByEstado(OrderStatus estado) {
        return orderRepository.findByEstado(estado).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    private OrderDto toDto(Order order) {
        return OrderDto.builder()
                .idPedido(order.getIdPedido())
                .numeroPedido(order.getNumeroPedido())
                .idCompany(order.getIdCompany())
                .idZone(order.getIdZone())
                .idRider(order.getIdRider())
                .estado(order.getEstado())
                .fechaCreacion(order.getFechaCreacion())
                .fechaEntrega(order.getFechaEntrega())
                .lugarEntrega(order.getLugarEntrega())
                .pagado(order.getPagado())
                .build();
    }
}
