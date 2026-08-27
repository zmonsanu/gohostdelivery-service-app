package com.zms.gohostdeliveryservice.infrastructure.integration.pizzagest;

import com.fasterxml.jackson.databind.JsonNode;
import com.zms.gohostdeliveryservice.domain.model.*;
import com.zms.gohostdeliveryservice.domain.model.enums.OrderStatus;
import com.zms.gohostdeliveryservice.domain.port.out.*;
import jakarta.annotation.PostConstruct;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zms.gohostdeliveryservice.domain.port.PizzaGestSchedulerControl;
import java.text.Normalizer;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Component
@RequiredArgsConstructor
@Slf4j
public class PizzaGestScheduler implements PizzaGestSchedulerControl {

    private final PizzaGestClient pizzaGestClient;
    private final OrderRepository orderRepository;
    private final CompanyRepository companyRepository;
    private final CityRepository cityRepository;
    private final StreetRepository streetRepository;
    private final ZoneRepository zoneRepository;
    private final OrderEventPublisher orderEventPublisher;

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Value("${pizzagest.default-company-id:}")
    private String defaultCompanyIdStr;

    @Value("${pizzagest.scheduler.enabled:true}")
    private boolean defaultEnabledValue;

    @Getter
    @Setter
    private volatile boolean active;

    @PostConstruct
    public void init() {
        this.active = defaultEnabledValue;
        log.info("Inicializando PizzaGestScheduler con active = {}", this.active);
    }

    @Scheduled(fixedDelay = 50000) // Cada 50 segundos
    public void importOrders() {
        if (!active) {
            log.debug("El sincronizador de PizzaGest está inactivo. Omitiendo ciclo.");
            return;
        }

        log.info("Iniciando tarea programada de importación de pedidos de PizzaGest...");
        String token = pizzaGestClient.login();
        if (token == null) {
            log.error("No se pudo obtener el token de autenticación para PizzaGest.");
            return;
        }

        JsonNode response = pizzaGestClient.getOrders(token);
        if (response == null || !response.has("response")) {
            log.warn("Respuesta de pedidos vacía o inválida de PizzaGest.");
            return;
        }

        JsonNode branches = response.path("response").path("Branches");
        if (branches.isMissingNode() || !branches.isArray()) {
            log.info("No se encontraron sucursales en los datos recibidos de PizzaGest.");
            return;
        }

        // Cargar todas las ciudades y calles de Vecindario para el mapeo in-memory
        Optional<City> vecindarioOpt = cityRepository.findAll().stream()
                .filter(c -> normalize(c.getNombre()).contains("VECINDARIO"))
                .findFirst();

        List<Street> streets = List.of();
        if (vecindarioOpt.isPresent()) {
            streets = streetRepository.findByIdCity(vecindarioOpt.get().getId());
        } else {
            log.warn("No se encontró la ciudad 'Vecindario' en la base de datos.");
        }

        int importedCount = 0;

        for (JsonNode branch : branches) {
            String branchName = branch.path("BranchName").asText("Desconocida");
            JsonNode orders = branch.path("Orders");
            if (orders.isMissingNode() || !orders.isArray()) {
                continue;
            }

            for (JsonNode o : orders) {
                String ticketCode = o.path("TicketCode").asText();
                if (ticketCode == null || ticketCode.isBlank() || "null".equalsIgnoreCase(ticketCode)) {
                    String numTicket = o.path("NumTicket").asText();
                    if (numTicket != null && !numTicket.isBlank() && !"null".equalsIgnoreCase(numTicket)) {
                        ticketCode = numTicket;
                    } else {
                        String orderCode = o.path("OrderCode").asText();
                        if (orderCode != null && !orderCode.isBlank() && !"null".equalsIgnoreCase(orderCode)) {
                            ticketCode = orderCode;
                        } else {
                            ticketCode = "";
                        }
                    }
                }

                if (ticketCode == null || ticketCode.isBlank()) {
                    continue;
                }

                // 1. Evitar duplicados (comprobamos en las últimas 48 horas para evitar falsos positivos con tickets de días anteriores)
                if (orderRepository.existsByNumeroPedidoAndFechaCreacionAfter(ticketCode, LocalDateTime.now().minusDays(2))) {
                    continue;
                }

                try {
                    String streetName = o.path("ClientStreet").asText("");
                    String streetNumber = o.path("StreetNumber").asText("");
                    String city = o.path("City").asText("Vecindario");

                    // 2. Mapear la calle a una zona y compañía (Jerarquía de asignación)
                    UUID matchedZoneId = null;
                    UUID matchedCompanyId = null;

                    // Paso 1 (Primario): Intentar emparejar calle y rango en BD
                    Street matchedStreet = findMatchingStreet(streetName, streetNumber, streets);
                    if (matchedStreet != null && matchedStreet.getIdZone() != null) {
                        matchedZoneId = matchedStreet.getIdZone();
                        Optional<Zone> zoneOpt = zoneRepository.findById(matchedZoneId);
                        if (zoneOpt.isPresent()) {
                            matchedCompanyId = zoneOpt.get().getIdCompany();
                        }
                    }

                    // Paso 2 (Secundario): Coincidencia por nombre comercial de la compañía
                    if (matchedCompanyId == null) {
                        matchedCompanyId = findCompanyByBranchName(branchName);
                    }

                    // Paso 3 (Terciario): Compañía por defecto configurada en properties/secrets
                    if (matchedCompanyId == null) {
                        matchedCompanyId = resolveConfiguredDefaultCompanyId();
                    }

                    // Paso 4 (Cuaternario): Primera compañía en BD como último recurso para evitar pérdida de datos
                    if (matchedCompanyId == null) {
                        matchedCompanyId = resolveFirstCompanyFallback();
                        if (matchedCompanyId != null) {
                            log.warn("Pedido {} de PizzaGest no pudo asociarse por zona ni por nombre de sucursal ({}). " +
                                             "Asignando a la primera compañía en BD por defecto: {}", 
                                    ticketCode, branchName, matchedCompanyId);
                        }
                    }

                    if (matchedCompanyId == null) {
                        log.error("No se pudo asociar el pedido {} de PizzaGest a ninguna compañía en la base de datos. Saltando pedido.", ticketCode);
                        continue;
                    }

                    // 3. Crear el modelo de orden
                    LocalDateTime fechaCreacion = parseDate(o.path("OrderDate").asText());
                    LocalDateTime fechaEntrega = parseDate(o.path("DeliveryDate").asText());
                    String lugarEntrega = (streetName.trim() + ", " + streetNumber.trim() + ", " + city.trim()).trim();

                    Order order = Order.builder()
                            .idPedido(UUID.randomUUID())
                            .numeroPedido(ticketCode)
                            .idCompany(matchedCompanyId)
                            .idZone(matchedZoneId)
                            .estado(OrderStatus.RECIBIDO)
                            .fechaCreacion(fechaCreacion != null ? fechaCreacion : LocalDateTime.now())
                            .fechaEntrega(fechaEntrega)
                            .lugarEntrega(lugarEntrega)
                            .pagado(false)
                            .build();

                    Order saved = orderRepository.save(order);
                    log.info("Pedido de PizzaGest {} importado con éxito. Compañía asignada: {}, Zona: {}", 
                            ticketCode, matchedCompanyId, matchedZoneId);

                    // 4. Publicar evento para colas y notificaciones
                    orderEventPublisher.publishOrderCreated(saved);
                    importedCount++;

                } catch (Exception e) {
                    log.error("Error al procesar el pedido {} de PizzaGest: {}", ticketCode, e.getMessage(), e);
                }
            }
        }
        log.info("Proceso de importación finalizado. Pedidos importados en este ciclo: {}", importedCount);
    }

    private UUID findCompanyByBranchName(String branchName) {
        if (branchName == null || branchName.isBlank()) {
            return null;
        }
        String normalizedBranch = normalize(branchName);
        List<Company> companies = companyRepository.findAll();
        for (Company c : companies) {
            if (c.getNombreComercial() != null) {
                String normalizedComp = normalize(c.getNombreComercial());
                if (!normalizedComp.isBlank() && (normalizedBranch.contains(normalizedComp) || normalizedComp.contains(normalizedBranch))) {
                    log.debug("Coincidencia de nombre de sucursal encontrada. Mapeando '{}' a compañía '{}' ({})",
                            branchName, c.getNombreComercial(), c.getId());
                    return c.getId();
                }
            }
        }
        return null;
    }

    private UUID resolveConfiguredDefaultCompanyId() {
        if (defaultCompanyIdStr != null && !defaultCompanyIdStr.isBlank()) {
            try {
                return UUID.fromString(defaultCompanyIdStr);
            } catch (IllegalArgumentException e) {
                log.warn("El pizzagest.default-company-id configurado no es un UUID válido: {}", defaultCompanyIdStr);
            }
        }
        return null;
    }

    private UUID resolveFirstCompanyFallback() {
        List<Company> companies = companyRepository.findAll();
        if (!companies.isEmpty()) {
            return companies.get(0).getId();
        }
        return null;
    }

    private LocalDateTime parseDate(String dateStr) {
        if (dateStr == null || dateStr.isBlank()) {
            return null;
        }
        try {
            return LocalDateTime.parse(dateStr, DATE_FORMATTER);
        } catch (Exception e) {
            log.warn("No se pudo parsear la fecha de PizzaGest '{}': {}", dateStr, e.getMessage());
            return null;
        }
    }

    // ── LÓGICA DE MAPEO DE CALLES COPIADA DE MONITOR_PEDIDOS.PY ──

    private Street findMatchingStreet(String streetName, String streetNumberStr, List<Street> streets) {
        if (streetName == null || streetName.isBlank()) {
            return null;
        }

        String normalizedOrderStreet = normalize(streetName);
        Integer number = parseStreetNumber(streetNumberStr);
        String cleanedOrderStreet = cleanStreetName(normalizedOrderStreet);

        Street bestMatch = null;
        double bestScore = 0.0;

        for (Street dbStreet : streets) {
            String normalizedDbStreet = normalize(dbStreet.getNombre());
            String cleanedDbStreet = cleanStreetName(normalizedDbStreet);

            // Coincidencia exacta o parcial directa
            if (cleanedDbStreet.equals(cleanedOrderStreet) 
                    || normalizedDbStreet.contains(normalizedOrderStreet) 
                    || normalizedOrderStreet.contains(normalizedDbStreet)) {
                if (isNumberInStreetRange(number, dbStreet.getNumMin(), dbStreet.getNumMax())) {
                    return dbStreet;
                }
            }

            // Puntuación de similitud
            double score = calculateSimilarity(cleanedDbStreet, cleanedOrderStreet);
            if (score > bestScore) {
                bestScore = score;
                bestMatch = dbStreet;
            }
        }

        // Mapeo difuso con umbral mínimo
        double UMBRAL = 0.72;
        if (bestScore >= UMBRAL && bestMatch != null) {
            if (isNumberInStreetRange(number, bestMatch.getNumMin(), bestMatch.getNumMax())) {
                return bestMatch;
            }
        }

        return null;
    }

    private String normalize(String text) {
        if (text == null) return "";
        String normalized = Normalizer.normalize(text.toUpperCase(), Normalizer.Form.NFD);
        return normalized.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
    }

    private String cleanStreetName(String text) {
        return text.replaceAll("\\b(CALLE|CL|AVENIDA|AV|PASAJE|PASEO|LUGAR|CAMINO|CARRETERA|URBANIZACION|PQUE|PSO)\\b", "")
                   .replaceAll("[,\\-\\d]+", " ")
                   .trim();
    }

    private Integer parseStreetNumber(String numberStr) {
        if (numberStr == null || numberStr.isBlank()) {
            return null;
        }
        try {
            java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("\\d+").matcher(numberStr);
            if (matcher.find()) {
                return Integer.parseInt(matcher.group());
            }
        } catch (Exception e) {
            // Ignorar
        }
        return null;
    }

    private boolean isNumberInStreetRange(Integer number, Integer min, Integer max) {
        if (min == null && max == null) {
            return true;
        }
        if (number == null) {
            return false;
        }
        if (min != null && number < min) {
            return false;
        }
        if (max != null && number > max) {
            return false;
        }
        return true;
    }

    private double calculateSimilarity(String s1, String s2) {
        int maxLen = Math.max(s1.length(), s2.length());
        if (maxLen == 0) return 1.0;
        return (maxLen - getLevenshteinDistance(s1, s2)) / (double) maxLen;
    }

    private int getLevenshteinDistance(String s, String t) {
        if (s == null || t == null) {
            throw new IllegalArgumentException("Strings must not be null");
        }
        int n = s.length();
        int m = t.length();
        if (n == 0) return m;
        if (m == 0) return n;
        int[] p = new int[n + 1];
        int[] d = new int[n + 1];
        int[] _d;
        int i, j, cost;
        char t_j;
        for (i = 0; i <= n; i++) {
            p[i] = i;
        }
        for (j = 1; j <= m; j++) {
            t_j = t.charAt(j - 1);
            d[0] = j;
            for (i = 1; i <= n; i++) {
                cost = s.charAt(i - 1) == t_j ? 0 : 1;
                d[i] = Math.min(Math.min(d[i - 1] + 1, p[i] + 1), p[i - 1] + cost);
            }
            _d = p;
            p = d;
            d = _d;
        }
        return p[n];
    }
}
