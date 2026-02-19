package com.zms.gohostdeliveryservice.application.command.order;

import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UpdateOrderStatusCommand {
    private UUID orderId;
    private OrderStatus estado;
}
