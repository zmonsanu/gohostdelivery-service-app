package com.zms.gohostdeliveryservice.application.command.rider;

import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Rider;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PartialUpdateRiderCommandHandler {

    private final RiderRepository riderRepository;

    public RiderDto handle(PartialUpdateRiderCommand command) {
        Rider rider = riderRepository.findById(command.getId())
                .orElseThrow(() -> new RiderNotFoundException(command.getId()));

        if (command.getNombre() != null)
            rider.setNombre(command.getNombre());
        if (command.getApellido() != null)
            rider.setApellido(command.getApellido());
        if (command.getDocIdentidad() != null)
            rider.setDocIdentidad(command.getDocIdentidad());
        if (command.getDireccion() != null)
            rider.setDireccion(command.getDireccion());
        if (command.getMunicipio() != null)
            rider.setMunicipio(command.getMunicipio());
        if (command.getProvincia() != null)
            rider.setProvincia(command.getProvincia());
        if (command.getTelefono() != null)
            rider.setTelefono(command.getTelefono());
        if (command.getEmail() != null)
            rider.setEmail(command.getEmail());
        if (command.getActivo() != null)
            rider.setActivo(command.getActivo());

        Rider saved = riderRepository.save(rider);

        return toDto(saved);
    }

    private RiderDto toDto(Rider rider) {
        return RiderDto.builder()
                .id(rider.getId())
                .nombre(rider.getNombre())
                .apellido(rider.getApellido())
                .docIdentidad(rider.getDocIdentidad())
                .direccion(rider.getDireccion())
                .municipio(rider.getMunicipio())
                .provincia(rider.getProvincia())
                .telefono(rider.getTelefono())
                .email(rider.getEmail())
                .activo(rider.getActivo())
                .build();
    }
}
