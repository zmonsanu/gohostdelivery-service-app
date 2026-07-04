package com.zms.gohostdeliveryservice.infrastructure.integration.pizzagest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

@Component
@Slf4j
public class PizzaGestClient {

    private final HttpClient httpClient = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(10))
            .build();
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
            String json = String.format("{\"User\":\"%s\",\"Pass\":\"%s\",\"ClientCode\":\"%s\"}", 
                    sanitize(user), sanitize(pass), sanitize(clientCode));

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("Content-Type", "application/json;charset=utf-8;")
                    .header("User-Agent", "Mozilla/5.0")
                    .POST(HttpRequest.BodyPublishers.ofString(json))
                    .build();

            log.info("Autenticando en PizzaGest ({}) con usuario: '{}', ClientCode: '{}', Pass length: {}", 
                    url, sanitize(user), sanitize(clientCode), sanitize(pass) != null ? sanitize(pass).length() : 0);

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
            
            if (response.statusCode() >= 200 && response.statusCode() < 300 && response.body() != null) {
                JsonNode root = objectMapper.readTree(response.body());
                return root.path("response").path("token").asText();
            } else {
                log.error("Fallo al autenticar en PizzaGest. HTTP Status: {}, Body: {}", response.statusCode(), response.body());
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
            String json = String.format("{\"HubCode\":\"%s\",\"Client\":\"%s\",\"Language\":\"es\"}", 
                    sanitize(hubCode), sanitize(clientCode));

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("Content-Type", "application/json;charset=utf-8;")
                    .header("Authorization", "Bearer " + token)
                    .header("User-Agent", "Mozilla/5.0")
                    .POST(HttpRequest.BodyPublishers.ofString(json))
                    .build();

            log.debug("Obteniendo pedidos de PizzaGest ({}) con hub-code: {}", url, sanitize(hubCode));
            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() >= 200 && response.statusCode() < 300 && response.body() != null) {
                return objectMapper.readTree(response.body());
            } else {
                log.error("Fallo al obtener pedidos de PizzaGest. HTTP Status: {}, Body: {}", response.statusCode(), response.body());
            }
        } catch (Exception e) {
            log.error("Error al obtener pedidos de PizzaGest: {}", e.getMessage(), e);
        }
        return null;
    }

    private String sanitize(String value) {
        if (value == null) return "";
        String trimmed = value.trim();
        if (trimmed.startsWith("\"") && trimmed.endsWith("\"")) {
            trimmed = trimmed.substring(1, trimmed.length() - 1);
        }
        if (trimmed.startsWith("'") && trimmed.endsWith("'")) {
            trimmed = trimmed.substring(1, trimmed.length() - 1);
        }
        return trimmed.trim();
    }
}
