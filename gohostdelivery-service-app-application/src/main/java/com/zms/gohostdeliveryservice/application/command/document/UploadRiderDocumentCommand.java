package com.zms.gohostdeliveryservice.application.command.document;

import com.zms.gohostdeliveryservice.domain.model.enums.TipoDocumento;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UploadRiderDocumentCommand {
    private UUID riderId;
    private TipoDocumento tipoDocumento;
    private String nombreFichero;
    private String contentType;
    private byte[] contenido;
}
