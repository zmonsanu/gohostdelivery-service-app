package com.zms.gohostdeliveryservice.infrastructure.integration.pizzagest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Component
@Slf4j
public class PizzaGestClient {

    private final RestTemplate restTemplate = new RestTemplate();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Value("${pizzagest.url:https://tiendaonline4.pizzagest.info/PAV_JWT/}")
    private String pizzagestUrl;

    @Value("${pizzagest.user:34003655}")
    private String user;

    @Value("${pizzagest.pass:3655}")
    private String pass;

    @Value("${pizzagest.client-code:10}")
    private String clientCode;

    @Value("${pizzagest.hub-code:4}")
    private String hubCode;

    public String login() {
        try {
            String url = pizzagestUrl + "authenticateEmployee";
            Map<String, String> request = new HashMap<>();
            request.put("User", user);
            request.put("Pass", pass);
            request.put("ClientCode", clientCode);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

            log.info("Autenticando en PizzaGest ({}) con usuario: {}", url, user);
            ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                JsonNode root = objectMapper.readTree(response.getBody());
                return root.path("response").path("token").asText();
            }
        } catch (Exception e) {
            log.error("Error al autenticar en PizzaGest: {}", e.getMessage(), e);
        }
        return null;
    }

    public JsonNode getOrders(String token) {
        if (token == null || token.isBlank()) {
            return null;
        }
        try {
            String url = pizzagestUrl + "getordersbyhubmarketplace";
            Map<String, String> request = new HashMap<>();
            request.put("HubCode", hubCode);
            request.put("Client", clientCode);
            request.put("Language", "es");

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + token);
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

            log.debug("Obteniendo pedidos de PizzaGest ({}) con hub-code: {}", url, hubCode);
            ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                return objectMapper.readTree(response.getBody());
            }
        } catch (Exception e) {
            log.error("Error al obtener pedidos de PizzaGest: {}", e.getMessage(), e);
        }
        return null;
    }
}
