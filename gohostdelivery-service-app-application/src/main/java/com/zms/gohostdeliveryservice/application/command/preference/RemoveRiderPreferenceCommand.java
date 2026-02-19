package com.zms.gohostdeliveryservice.application.command.preference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RemoveRiderPreferenceCommand {
    private UUID companyId;
    private UUID riderId;
}
