package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.Order;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.OrderRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.OrderJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataOrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class OrderRepositoryAdapter implements OrderRepository {

    private final SpringDataOrderRepository springDataOrderRepository;

    @Override
    public Order save(Order order) {
        return toDomain(springDataOrderRepository.save(toEntity(order)));
    }

    @Override
    public Optional<Order> findById(UUID id) {
        return springDataOrderRepository.findById(id).map(this::toDomain);
    }

    @Override
    public List<Order> findAll() {
        return springDataOrderRepository.findAll().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public List<Order> findByCompanyId(UUID companyId) {
        List<OrderJpaEntity> entities = springDataOrderRepository.findByIdCompany(companyId);
        if (entities == null)
            return java.util.Collections.emptyList();
        return entities.stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public List<Order> findByRiderId(UUID riderId) {
        List<OrderJpaEntity> entities = springDataOrderRepository.findByIdRider(riderId);
        if (entities == null)
            return java.util.Collections.emptyList();
        return entities.stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public List<Order> findByEstado(OrderStatus estado) {
        List<OrderJpaEntity> entities = springDataOrderRepository.findByEstado(estado);
        if (entities == null)
            return java.util.Collections.emptyList();
        return entities.stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public boolean existsByNumeroPedido(String numeroPedido) {
        return springDataOrderRepository.existsByNumeroPedido(numeroPedido);
    }

    @Override
    public List<Order> findByFilters(UUID idCompany, UUID idRider, UUID idZone, OrderStatus estado,
            java.time.LocalDateTime fechaDesde, java.time.LocalDateTime fechaHasta) {
        org.springframework.data.jpa.domain.Specification<OrderJpaEntity> spec = (root, query, cb) -> {
            java.util.List<jakarta.persistence.criteria.Predicate> predicates = new java.util.ArrayList<>();

            if (idCompany != null)
                predicates.add(cb.equal(root.get("idCompany"), idCompany));
            if (idRider != null)
                predicates.add(cb.equal(root.get("idRider"), idRider));
            if (idZone != null)
                predicates.add(cb.equal(root.get("idZone"), idZone));
            if (estado != null)
                predicates.add(cb.equal(root.get("estado"), estado));
            if (fechaDesde != null)
                predicates.add(cb.greaterThanOrEqualTo(root.get("fechaCreacion"), fechaDesde));
            if (fechaHasta != null)
                predicates.add(cb.lessThanOrEqualTo(root.get("fechaCreacion"), fechaHasta));

            return cb.and(predicates.toArray(new jakarta.persistence.criteria.Predicate[0]));
        };

        return springDataOrderRepository.findAll(spec).stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    private OrderJpaEntity toEntity(Order order) {
        return OrderJpaEntity.builder()
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

    private Order toDomain(OrderJpaEntity entity) {
        return Order.builder()
                .idPedido(entity.getIdPedido())
                .numeroPedido(entity.getNumeroPedido())
                .idCompany(entity.getIdCompany())
                .idZone(entity.getIdZone())
                .idRider(entity.getIdRider())
                .estado(entity.getEstado())
                .fechaCreacion(entity.getFechaCreacion())
                .fechaEntrega(entity.getFechaEntrega())
                .lugarEntrega(entity.getLugarEntrega())
                .pagado(entity.getPagado())
                .build();
    }
}
