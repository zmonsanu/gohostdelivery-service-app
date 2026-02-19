package com.zms.gohostdeliveryservice.application.command.order;

import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.domain.exception.OrderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class DeliverOrderCommandHandler {

    private final OrderRepository orderRepository;

    public OrderDto handle(DeliverOrderCommand command) {
        Order order = orderRepository.findById(command.getOrderId())
                .orElseThrow(() -> new OrderNotFoundException(command.getOrderId()));

        order.setEstado(OrderStatus.ENTREGADO);
        order.setFechaEntrega(LocalDateTime.now());
        order.setLugarEntrega(command.getLugarEntrega());

        Order saved = orderRepository.save(order);

        return toDto(saved);
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
