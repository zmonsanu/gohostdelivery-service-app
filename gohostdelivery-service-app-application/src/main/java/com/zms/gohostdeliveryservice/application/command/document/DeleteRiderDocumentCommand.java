package com.zms.gohostdeliveryservice.application.command.document;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeleteRiderDocumentCommand {
    private UUID riderId;
    private UUID documentId;
}
