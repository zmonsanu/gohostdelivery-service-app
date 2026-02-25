package com.zms.gohostdeliveryservice.infrastructure.persistence.adapter;

import com.zms.gohostdeliveryservice.domain.model.RiderDocument;
import com.zms.gohostdeliveryservice.domain.model.RiderDocumentBlob;
import com.zms.gohostdeliveryservice.domain.port.out.RiderDocumentRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.RiderDocumentBlobJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.entity.RiderDocumentJpaEntity;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataRiderDocumentBlobRepository;
import com.zms.gohostdeliveryservice.infrastructure.persistence.repository.SpringDataRiderDocumentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class RiderDocumentRepositoryAdapter implements RiderDocumentRepository {

    private final SpringDataRiderDocumentRepository documentRepository;
    private final SpringDataRiderDocumentBlobRepository blobRepository;

    @Override
    public RiderDocument saveDocument(RiderDocument document) {
        RiderDocumentJpaEntity entity = RiderDocumentJpaEntity.builder()
                .id(document.getId())
                .riderId(document.getRiderId())
                .tipoDocumento(document.getTipoDocumento())
                .nombreFichero(document.getNombreFichero())
                .contentType(document.getContentType())
                .fechaSubida(document.getFechaSubida())
                .build();
        RiderDocumentJpaEntity saved = documentRepository.save(entity);
        return toDomain(saved);
    }

    @Override
    public RiderDocumentBlob saveBlob(RiderDocumentBlob blob) {
        RiderDocumentBlobJpaEntity entity = RiderDocumentBlobJpaEntity.builder()
                .id(blob.getId())
                .riderDocumentId(blob.getRiderDocumentId())
                .contenido(blob.getContenido())
                .build();
        RiderDocumentBlobJpaEntity saved = blobRepository.save(entity);
        return RiderDocumentBlob.builder()
                .id(saved.getId())
                .riderDocumentId(saved.getRiderDocumentId())
                .contenido(saved.getContenido())
                .build();
    }

    @Override
    public Optional<RiderDocument> findDocumentById(UUID id) {
        return documentRepository.findById(id).map(this::toDomain);
    }

    @Override
    public Optional<RiderDocumentBlob> findBlobByDocumentId(UUID documentId) {
        return blobRepository.findByRiderDocumentId(documentId)
                .map(e -> RiderDocumentBlob.builder()
                        .id(e.getId())
                        .riderDocumentId(e.getRiderDocumentId())
                        .contenido(e.getContenido())
                        .build());
    }

    @Override
    public List<RiderDocument> findDocumentsByRiderId(UUID riderId) {
        List<RiderDocumentJpaEntity> entities = documentRepository.findByRiderId(riderId);
        if (entities == null)
            return java.util.Collections.emptyList();
        return entities.stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public void deleteDocumentById(UUID id) {
        documentRepository.deleteById(id);
    }

    private RiderDocument toDomain(RiderDocumentJpaEntity entity) {
        return RiderDocument.builder()
                .id(entity.getId())
                .riderId(entity.getRiderId())
                .tipoDocumento(entity.getTipoDocumento())
                .nombreFichero(entity.getNombreFichero())
                .contentType(entity.getContentType())
                .fechaSubida(entity.getFechaSubida())
                .build();
    }
}
