package com.zms.gohostdeliveryservice.application.command.document;

import com.zms.gohostdeliveryservice.domain.exception.RiderDocumentNotFoundException;
import com.zms.gohostdeliveryservice.domain.port.out.RiderDocumentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DeleteRiderDocumentCommandHandler {

    private final RiderDocumentRepository riderDocumentRepository;

    public void handle(DeleteRiderDocumentCommand command) {
        riderDocumentRepository.findDocumentById(command.getDocumentId())
                .orElseThrow(() -> new RiderDocumentNotFoundException(command.getDocumentId()));

        riderDocumentRepository.deleteDocumentById(command.getDocumentId());
    }
}
