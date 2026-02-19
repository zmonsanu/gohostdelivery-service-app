package com.zms.gohostdeliveryservice.domain.port.out;

import com.zms.gohostdeliveryservice.domain.model.RiderDocument;
import com.zms.gohostdeliveryservice.domain.model.RiderDocumentBlob;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface RiderDocumentRepository {
    RiderDocument saveDocument(RiderDocument document);

    RiderDocumentBlob saveBlob(RiderDocumentBlob blob);

    Optional<RiderDocument> findDocumentById(UUID id);

    Optional<RiderDocumentBlob> findBlobByDocumentId(UUID documentId);

    List<RiderDocument> findDocumentsByRiderId(UUID riderId);

    void deleteDocumentById(UUID id);
}
