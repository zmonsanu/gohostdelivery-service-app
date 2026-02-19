package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface OrderRepository {
    Order save(Order order);

    Optional<Order> findById(UUID id);

    List<Order> findAll();

    List<Order> findByCompanyId(UUID companyId);

    List<Order> findByRiderId(UUID riderId);

    List<Order> findByEstado(OrderStatus estado);

    boolean existsByNumeroPedido(String numeroPedido);
}
