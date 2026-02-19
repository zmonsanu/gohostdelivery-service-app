package com.zms.gohostdeliveryservice.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RiderDocumentBlob {

    private UUID id;
    private UUID riderDocumentId;
    private byte[] contenido;
}
