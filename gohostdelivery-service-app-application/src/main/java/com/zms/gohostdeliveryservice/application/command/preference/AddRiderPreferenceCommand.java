package com.zms.gohostdeliveryservice.application.command.preference;

import com.zms.gohostdeliveryservice.domain.model.enums.TipoPreferencia;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AddRiderPreferenceCommand {
    private UUID companyId;
    private UUID riderId;
    private TipoPreferencia tipoPreferencia;
}
