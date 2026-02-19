package com.zms.gohostdeliveryservice.application.dto;

import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {
    private UUID idPedido;
    private String numeroPedido;
    private UUID idCompany;
    private UUID idZone;
    private UUID idRider;
    private OrderStatus estado;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaEntrega;
    private String lugarEntrega;
    private Boolean pagado;
}
