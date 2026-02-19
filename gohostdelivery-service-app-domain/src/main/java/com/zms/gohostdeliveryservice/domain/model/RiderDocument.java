package com.zms.gohostdeliveryservice.domain.model;

import com.zms.gohostdeliveryservice.domain.model.enums.TipoDocumento;
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
public class RiderDocument {

    private UUID id;
    private UUID riderId;
    private TipoDocumento tipoDocumento;
    private String nombreFichero;
    private String contentType;
    private LocalDateTime fechaSubida;
}
