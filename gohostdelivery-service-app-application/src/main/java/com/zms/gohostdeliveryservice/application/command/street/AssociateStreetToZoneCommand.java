package com.zms.gohostdeliveryservice.application.command.street;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AssociateStreetToZoneCommand {
    private UUID idStreet;
    private UUID idZone;
}
