package com.zms.gohostdeliveryservice.application.command.rider;

import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.domain.exception.DuplicateEmailException;
import com.zms.gohostdeliveryservice.domain.model.Rider;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CreateRiderCommandHandler {

    private final RiderRepository riderRepository;

    public RiderDto handle(CreateRiderCommand command) {
        if (riderRepository.existsByEmail(command.getEmail())) {
            throw new DuplicateEmailException(command.getEmail());
        }

        Rider rider = Rider.builder()
                .id(UUID.randomUUID())
                .nombre(command.getNombre())
                .apellido(command.getApellido())
                .docIdentidad(command.getDocIdentidad())
                .direccion(command.getDireccion())
                .municipio(command.getMunicipio())
                .provincia(command.getProvincia())
                .telefono(command.getTelefono())
                .email(command.getEmail())
                .activo(true)
                .build();

        Rider saved = riderRepository.save(rider);

        return RiderDto.builder()
                .id(saved.getId())
                .nombre(saved.getNombre())
                .apellido(saved.getApellido())
                .docIdentidad(saved.getDocIdentidad())
                .direccion(saved.getDireccion())
                .municipio(saved.getMunicipio())
                .provincia(saved.getProvincia())
                .telefono(saved.getTelefono())
                .email(saved.getEmail())
                .activo(saved.getActivo())
                .build();
    }
}
