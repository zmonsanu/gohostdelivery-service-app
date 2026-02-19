package com.zms.gohostdeliveryservice.application.command.order;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateOrderCommand {
    private UUID idCompany;
    private UUID idZone;
    private String numeroPedido;
}
