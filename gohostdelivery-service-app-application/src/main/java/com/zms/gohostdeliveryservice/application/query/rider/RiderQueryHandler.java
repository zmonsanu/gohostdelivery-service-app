package com.zms.gohostdeliveryservice.application.query.rider;

import com.zms.gohostdeliveryservice.application.dto.RiderDto;
import com.zms.gohostdeliveryservice.domain.exception.RiderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.Rider;
import com.zms.gohostdeliveryservice.domain.port.out.RiderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RiderQueryHandler {

    private final RiderRepository riderRepository;

    public RiderDto getById(UUID id) {
        Rider rider = riderRepository.findById(id)
                .orElseThrow(() -> new RiderNotFoundException(id));
        return toDto(rider);
    }

    public List<RiderDto> listAll() {
        return riderRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
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
