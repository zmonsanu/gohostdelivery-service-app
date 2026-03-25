package com.zms.gohostdeliveryservice.rest.controller;

import com.zms.gohostdeliveryservice.application.command.rider.CreateRiderCommand;
import com.zms.gohostdeliveryservice.application.command.rider.CreateRiderCommandHandler;
import com.zms.gohostdeliveryservice.application.command.rider.PartialUpdateRiderCommand;
import com.zms.gohostdeliveryservice.application.command.rider.PartialUpdateRiderCommandHandler;
import com.zms.gohostdeliveryservice.application.command.document.DeleteRiderDocumentCommand;
import com.zms.gohostdeliveryservice.application.command.document.DeleteRiderDocumentCommandHandler;
import com.zms.gohostdeliveryservice.application.command.document.UploadRiderDocumentCommand;
import com.zms.gohostdeliveryservice.application.command.document.UploadRiderDocumentCommandHandler;
import com.zms.gohostdeliveryservice.application.dto.RiderDocumentDto;
import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.application.query.document.RiderDocumentQueryHandler;
import com.zms.gohostdeliveryservice.application.query.rider.RiderQueryHandler;
import com.zms.gohostdeliveryservice.domain.model.RiderDocumentBlob;
import com.zms.gohostdeliveryservice.domain.model.enums.TipoDocumento;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URI;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/riders")
@RequiredArgsConstructor
public class RiderController {

    private final CreateRiderCommandHandler createRiderCommandHandler;
    private final PartialUpdateRiderCommandHandler partialUpdateRiderCommandHandler;
    private final RiderQueryHandler riderQueryHandler;
    private final UploadRiderDocumentCommandHandler uploadRiderDocumentCommandHandler;
    private final DeleteRiderDocumentCommandHandler deleteRiderDocumentCommandHandler;
    private final RiderDocumentQueryHandler riderDocumentQueryHandler;
    private final com.zms.gohostdeliveryservice.application.query.zone.ZoneQueryHandler zoneQueryHandler;

    @PostMapping
    public ResponseEntity<RiderDto> createRider(@RequestBody CreateRiderCommand command) {
        RiderDto dto = createRiderCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/riders/" + dto.getId())).body(dto);
    }

    @PatchMapping("/{id}")
    public ResponseEntity<RiderDto> updateRiderPartial(@PathVariable UUID id,
            @RequestBody PartialUpdateRiderCommand command) {
        command.setId(id);
        return ResponseEntity.ok(partialUpdateRiderCommandHandler.handle(command));
    }

    @GetMapping("/{id}")
    public ResponseEntity<RiderDto> getRider(@PathVariable UUID id) {
        return ResponseEntity.ok(riderQueryHandler.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<RiderDto>> listRiders() {
        return ResponseEntity.ok(riderQueryHandler.listAll());
    }

    @GetMapping("/{riderId}/zones")
    public ResponseEntity<List<com.zms.gohostdeliveryservice.application.dto.ZoneDto>> getZonesByRider(
            @PathVariable UUID riderId) {
        return ResponseEntity.ok(zoneQueryHandler.getZonesByRider(riderId));
    }

    @GetMapping("/{riderId}/documents")
    public ResponseEntity<List<RiderDocumentDto>> listDocuments(@PathVariable UUID riderId) {
        return ResponseEntity.ok(riderDocumentQueryHandler.listDocumentsByRider(riderId));
    }

    @PostMapping("/{riderId}/documents")
    public ResponseEntity<RiderDocumentDto> uploadDocument(
            @PathVariable UUID riderId,
            @RequestParam("tipoDocumento") TipoDocumento tipoDocumento,
            @RequestParam("file") MultipartFile file) throws IOException {

        return uploadDocumentInternal(riderId, tipoDocumento, file);
    }

    @PostMapping("/{riderId}/upload-photo")
    public ResponseEntity<RiderDocumentDto> uploadPhoto(
            @PathVariable UUID riderId,
            @RequestParam("file") MultipartFile file) throws IOException {

        return uploadDocumentInternal(riderId, TipoDocumento.PROFILE_PHOTO, file);
    }

    @PostMapping("/{riderId}/upload-contract")
    public ResponseEntity<RiderDocumentDto> uploadContract(
            @PathVariable UUID riderId,
            @RequestParam("file") MultipartFile file) throws IOException {

        return uploadDocumentInternal(riderId, TipoDocumento.CONTRACT, file);
    }

    @PostMapping("/{riderId}/upload-document")
    public ResponseEntity<RiderDocumentDto> uploadIdentityDocument(
            @PathVariable UUID riderId,
            @RequestParam("file") MultipartFile file) throws IOException {

        return uploadDocumentInternal(riderId, TipoDocumento.ID_DOCUMENT, file);
    }

    private ResponseEntity<RiderDocumentDto> uploadDocumentInternal(
            UUID riderId, TipoDocumento tipoDocumento, MultipartFile file) throws IOException {

        String nombreFichero = file.getOriginalFilename();
        if (nombreFichero == null || nombreFichero.isBlank()) {
            nombreFichero = tipoDocumento.name().toLowerCase();
        }

        String contentType = file.getContentType();
        if (contentType == null || contentType.isBlank()) {
            contentType = "application/octet-stream";
        }

        UploadRiderDocumentCommand command = UploadRiderDocumentCommand.builder()
                .riderId(riderId)
                .tipoDocumento(tipoDocumento)
                .nombreFichero(nombreFichero)
                .contentType(contentType)
                .contenido(file.getBytes())
                .build();

        RiderDocumentDto dto = uploadRiderDocumentCommandHandler.handle(command);
        return ResponseEntity.created(URI.create("/riders/" + riderId + "/documents/" + dto.getId())).body(dto);
    }

    @GetMapping("/{riderId}/documents/{documentId}/download")
    public ResponseEntity<byte[]> downloadDocument(
            @PathVariable UUID riderId,
            @PathVariable UUID documentId) {

        RiderDocumentBlob blob = riderDocumentQueryHandler.downloadDocument(documentId);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"document\"")
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(blob.getContenido());
    }

    @DeleteMapping("/{riderId}/documents/{documentId}")
    public ResponseEntity<Void> deleteDocument(
            @PathVariable UUID riderId,
            @PathVariable UUID documentId) {

        deleteRiderDocumentCommandHandler.handle(
                DeleteRiderDocumentCommand.builder()
                        .riderId(riderId)
                        .documentId(documentId)
                        .build());
        return ResponseEntity.noContent().build();
    }
}
