package com.zms.gohostdeliveryservice.application.query.document;

import com.zms.gohostdeliveryservice.domain.exception.RiderDocumentNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.RiderDocumentBlob;
import com.zms.gohostdeliveryservice.domain.port.out.RiderDocumentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RiderDocumentQueryHandler {

    private final RiderDocumentRepository riderDocumentRepository;

    public RiderDocumentBlob downloadDocument(UUID documentId) {
        riderDocumentRepository.findDocumentById(documentId)
                .orElseThrow(() -> new RiderDocumentNotFoundException(documentId));

        return riderDocumentRepository.findBlobByDocumentId(documentId)
                .orElseThrow(() -> new RiderDocumentNotFoundException(documentId));
    }
}
