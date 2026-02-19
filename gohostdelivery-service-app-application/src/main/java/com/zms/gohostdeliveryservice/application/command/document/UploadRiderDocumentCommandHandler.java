package com.zms.gohostdeliveryservice.application.command.document;

import com.zms.gohostdeliveryservice.application.dto.RiderDocumentDto;
import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.RiderDocument;
import com.zms.gohostdeliveryservice.domain.model.RiderDocumentBlob;
import com.zms.gohostdeliveryservice.domain.port.out.RiderDocumentRepository;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UploadRiderDocumentCommandHandler {

    private final RiderDocumentRepository riderDocumentRepository;
    private final RiderRepository riderRepository;

    public RiderDocumentDto handle(UploadRiderDocumentCommand command) {
        riderRepository.findById(command.getRiderId())
                .orElseThrow(() -> new RiderNotFoundException(command.getRiderId()));

        RiderDocument document = RiderDocument.builder()
                .id(UUID.randomUUID())
                .riderId(command.getRiderId())
                .tipoDocumento(command.getTipoDocumento())
                .nombreFichero(command.getNombreFichero())
                .contentType(command.getContentType())
                .fechaSubida(LocalDateTime.now())
                .build();

        RiderDocument savedDoc = riderDocumentRepository.saveDocument(document);

        RiderDocumentBlob blob = RiderDocumentBlob.builder()
                .id(UUID.randomUUID())
                .riderDocumentId(savedDoc.getId())
                .contenido(command.getContenido())
                .build();

        riderDocumentRepository.saveBlob(blob);

        return RiderDocumentDto.builder()
                .id(savedDoc.getId())
                .riderId(savedDoc.getRiderId())
                .tipoDocumento(savedDoc.getTipoDocumento())
                .nombreFichero(savedDoc.getNombreFichero())
                .contentType(savedDoc.getContentType())
                .fechaSubida(savedDoc.getFechaSubida())
                .build();
    }
}
