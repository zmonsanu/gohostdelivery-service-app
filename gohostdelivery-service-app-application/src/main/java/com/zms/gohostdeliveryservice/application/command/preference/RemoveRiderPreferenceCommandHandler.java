package com.zms.gohostdeliveryservice.application.command.preference;

import com.zms.gohostdeliveryservice.domain.port.out.CompanyRiderPreferenceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RemoveRiderPreferenceCommandHandler {

    private final CompanyRiderPreferenceRepository preferenceRepository;

    public void handle(RemoveRiderPreferenceCommand command) {
        preferenceRepository.deleteByCompanyIdAndRiderId(command.getCompanyId(), command.getRiderId());
    }
}
