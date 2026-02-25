package com.zms.gohostdeliveryservice.application.query.document;

import com.zms.gohostdeliveryservice.application.dto.RiderDocumentDto;
import com.zms.gohostdeliveryservice.domain.exception.RiderDocumentNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.RiderDocument;
import com.zms.gohostdeliveryservice.domain.model.RiderDocumentBlob;
import com.zms.gohostdeliveryservice.domain.port.out.RiderDocumentRepository;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RiderDocumentQueryHandler {

    private final RiderDocumentRepository riderDocumentRepository;
    private final RiderRepository riderRepository;

    public List<RiderDocumentDto> listDocumentsByRider(UUID riderId) {
        riderRepository.findById(riderId)
                .orElseThrow(() -> new RiderNotFoundException(riderId));
        return riderDocumentRepository.findDocumentsByRiderId(riderId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public RiderDocumentBlob downloadDocument(UUID documentId) {
        riderDocumentRepository.findDocumentById(documentId)
                .orElseThrow(() -> new RiderDocumentNotFoundException(documentId));

        return riderDocumentRepository.findBlobByDocumentId(documentId)
                .orElseThrow(() -> new RiderDocumentNotFoundException(documentId));
    }

    private RiderDocumentDto toDto(RiderDocument document) {
        return RiderDocumentDto.builder()
                .id(document.getId())
                .riderId(document.getRiderId())
                .tipoDocumento(document.getTipoDocumento())
                .nombreFichero(document.getNombreFichero())
                .contentType(document.getContentType())
                .fechaSubida(document.getFechaSubida())
                .build();
    }
}
