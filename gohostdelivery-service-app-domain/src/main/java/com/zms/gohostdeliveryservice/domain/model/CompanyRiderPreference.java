package com.zms.gohostdeliveryservice.domain.model;

import com.zms.gohostdeliveryservice.domain.model.enums.TipoPreferencia;
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
public class CompanyRiderPreference {

    private UUID idPreference;
    private UUID idCompany;
    private UUID idRider;
    private TipoPreferencia tipoPreferencia;
    private LocalDateTime fechaAsignacion;
}
