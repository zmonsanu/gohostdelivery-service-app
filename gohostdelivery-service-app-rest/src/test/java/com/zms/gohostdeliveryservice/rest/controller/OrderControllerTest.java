package com.zms.gohostdeliveryservice.rest.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zms.gohostdeliveryservice.application.command.order.*;
import com.zms.gohostdeliveryservice.application.dto.OrderDto;
import com.zms.gohostdeliveryservice.application.query.order.OrderQueryHandler;
import com.zms.gohostdeliveryservice.domain.exception.CompanyNotFoundException;
import com.zms.gohostdeliveryservice.domain.exception.OrderNotFoundException;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(OrderController.class)
@DisplayName("REST - OrderController")
class OrderControllerTest {

        @Autowired
        private MockMvc mockMvc;

        @Autowired
        private ObjectMapper objectMapper;

        @MockitoBean
        private CreateOrderCommandHandler createOrderCommandHandler;

        @MockitoBean
        private AssignRiderToOrderCommandHandler assignRiderToOrderCommandHandler;

        @MockitoBean
        private UpdateOrderStatusCommandHandler updateOrderStatusCommandHandler;

        @MockitoBean
        private DeliverOrderCommandHandler deliverOrderCommandHandler;

        @MockitoBean
        private OrderQueryHandler orderQueryHandler;

        @Test
        @DisplayName("POST /orders → 201 Created cuando el pedido se crea correctamente")
        void createOrder_returns201_whenCreatedSuccessfully() throws Exception {
                UUID companyId = UUID.randomUUID();
                UUID orderId = UUID.randomUUID();

                CreateOrderCommand command = CreateOrderCommand.builder()
                                .idCompany(companyId)
                                .idZone(UUID.randomUUID())
                                .numeroPedido("PED-TEST-001")
                                .build();

                OrderDto dto = OrderDto.builder()
                                .idPedido(orderId)
                                .numeroPedido("PED-TEST-001")
                                .idCompany(companyId)
                                .estado(OrderStatus.RECIBIDO)
                                .fechaCreacion(LocalDateTime.now())
                                .pagado(false)
                                .build();

                when(createOrderCommandHandler.handle(any())).thenReturn(dto);

                mockMvc.perform(post("/orders")
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(objectMapper.writeValueAsString(command)))
                                .andExpect(status().isCreated())
                                .andExpect(jsonPath("$.numeroPedido").value("PED-TEST-001"))
                                .andExpect(jsonPath("$.estado").value("RECIBIDO"))
                                .andExpect(jsonPath("$.pagado").value(false));
        }

        @Test
        @DisplayName("POST /orders → 404 Not Found cuando la empresa no existe")
        void createOrder_returns404_whenCompanyNotFound() throws Exception {
                UUID companyId = UUID.randomUUID();

                CreateOrderCommand command = CreateOrderCommand.builder()
                                .idCompany(companyId)
                                .numeroPedido("PED-NO-COMP")
                                .build();

                when(createOrderCommandHandler.handle(any()))
                                .thenThrow(new CompanyNotFoundException(companyId));

                mockMvc.perform(post("/orders")
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(objectMapper.writeValueAsString(command)))
                                .andExpect(status().isNotFound())
                                .andExpect(jsonPath("$.status").value(404));
        }

        @Test
        @DisplayName("GET /orders/{id} → 200 OK con datos del pedido")
        void getOrder_returns200_whenFound() throws Exception {
                UUID orderId = UUID.randomUUID();
                OrderDto dto = OrderDto.builder()
                                .idPedido(orderId)
                                .numeroPedido("PED-GET")
                                .idCompany(UUID.randomUUID())
                                .estado(OrderStatus.EN_PROCESO)
                                .fechaCreacion(LocalDateTime.now())
                                .pagado(false)
                                .build();

                when(orderQueryHandler.getById(orderId)).thenReturn(dto);

                mockMvc.perform(get("/orders/{id}", orderId))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$.idPedido").value(orderId.toString()))
                                .andExpect(jsonPath("$.estado").value("EN_PROCESO"));
        }

        @Test
        @DisplayName("GET /orders/{id} → 404 Not Found cuando el pedido no existe")
        void getOrder_returns404_whenNotFound() throws Exception {
                UUID orderId = UUID.randomUUID();
                when(orderQueryHandler.getById(orderId))
                                .thenThrow(new OrderNotFoundException(orderId));

                mockMvc.perform(get("/orders/{id}", orderId))
                                .andExpect(status().isNotFound())
                                .andExpect(jsonPath("$.status").value(404));
        }

        @Test
        @DisplayName("PUT /orders/{orderId}/assign-rider → 200 OK cuando se asigna el rider")
        void assignRider_returns200_whenAssignedSuccessfully() throws Exception {
                UUID orderId = UUID.randomUUID();
                UUID riderId = UUID.randomUUID();

                AssignRiderToOrderCommand command = AssignRiderToOrderCommand.builder()
                                .riderId(riderId)
                                .build();

                OrderDto dto = OrderDto.builder()
                                .idPedido(orderId)
                                .numeroPedido("PED-ASSIGN")
                                .idCompany(UUID.randomUUID())
                                .idRider(riderId)
                                .estado(OrderStatus.RECIBIDO)
                                .fechaCreacion(LocalDateTime.now())
                                .pagado(false)
                                .build();

                when(assignRiderToOrderCommandHandler.handle(any())).thenReturn(dto);

                mockMvc.perform(put("/orders/{orderId}/assign-rider", orderId)
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(objectMapper.writeValueAsString(command)))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$.idRider").value(riderId.toString()));
        }

        @Test
        @DisplayName("GET /orders?estado=RECIBIDO → 200 OK filtrando por estado")
        void listOrders_returns200_filteredByEstado() throws Exception {
                OrderDto dto = OrderDto.builder()
                                .idPedido(UUID.randomUUID())
                                .numeroPedido("PED-FILT")
                                .idCompany(UUID.randomUUID())
                                .estado(OrderStatus.RECIBIDO)
                                .fechaCreacion(LocalDateTime.now())
                                .pagado(false)
                                .build();

                when(orderQueryHandler.listByFilters(any(), any(), any(), eq(OrderStatus.RECIBIDO), any(), any()))
                                .thenReturn(List.of(dto));

                mockMvc.perform(get("/orders").param("estado", "RECIBIDO"))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$.length()").value(1))
                                .andExpect(jsonPath("$[0].estado").value("RECIBIDO"));
        }
}
