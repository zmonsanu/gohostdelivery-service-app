package com.zms.gohostdeliveryservice.application.command.order;

import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.CompanyRepository;
import com.zms.gohostdeliveryservice.domain.port.out.OrderEventPublisher;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CreateOrderCommandHandler {

    private final OrderRepository orderRepository;
    private final CompanyRepository companyRepository;
    private final OrderEventPublisher orderEventPublisher;

    public OrderDto handle(CreateOrderCommand command) {
        companyRepository.findById(command.getIdCompany())
                .orElseThrow(() -> new CompanyNotFoundException(command.getIdCompany()));

        Order order = Order.builder()
                .idPedido(UUID.randomUUID())
                .numeroPedido(command.getNumeroPedido())
                .idCompany(command.getIdCompany())
                .idZone(command.getIdZone())
                .estado(OrderStatus.RECIBIDO)
                .fechaCreacion(LocalDateTime.now())
                .pagado(false)
                .build();

        Order saved = orderRepository.save(order);

        // Publicar evento en el bus de mensajes (Kafka local / Pub/Sub en GCP)
        // El OrderEventConsumer escuchará este evento y enviará la notificación FCM
        // asíncronamente
        orderEventPublisher.publishOrderCreated(saved);

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
