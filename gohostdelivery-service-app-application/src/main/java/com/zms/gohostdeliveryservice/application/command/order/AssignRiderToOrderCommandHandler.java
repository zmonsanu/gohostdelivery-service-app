package com.zms.gohostdeliveryservice.application.command.order;

import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.domain.exception.OrderNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AssignRiderToOrderCommandHandler {

    private final OrderRepository orderRepository;
    private final RiderRepository riderRepository;

    public OrderDto handle(AssignRiderToOrderCommand command) {
        Order order = orderRepository.findById(command.getOrderId())
                .orElseThrow(() -> new OrderNotFoundException(command.getOrderId()));

        riderRepository.findById(command.getRiderId())
                .orElseThrow(() -> new RiderNotFoundException(command.getRiderId()));

        order.setIdRider(command.getRiderId());
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
