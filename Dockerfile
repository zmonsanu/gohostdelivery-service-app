# ─────────────────────────────────────────
# STAGE 1: BUILD
# ─────────────────────────────────────────
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copiamos el POM raíz y los POMs de cada módulo primero (cache de dependencias)
COPY pom.xml .
COPY gohostdelivery-service-api-rest/pom.xml          gohostdelivery-service-api-rest/
COPY gohostdelivery-service-app-domain/pom.xml        gohostdelivery-service-app-domain/
COPY gohostdelivery-service-app-application/pom.xml   gohostdelivery-service-app-application/
COPY gohostdelivery-service-app-infrastructure/pom.xml gohostdelivery-service-app-infrastructure/
COPY gohostdelivery-service-app-rest/pom.xml          gohostdelivery-service-app-rest/
COPY gohostdelivery-service-app-boot/pom.xml          gohostdelivery-service-app-boot/

# Descargamos dependencias (aprovecha la caché de Docker si no cambian los POMs)
RUN mvn dependency:go-offline -B

# Copiamos el código fuente completo
COPY . .

# Compilamos y empaquetamos saltando tests
RUN mvn clean package -DskipTests -B

# ─────────────────────────────────────────
# STAGE 2: RUNTIME
# ─────────────────────────────────────────
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiamos el JAR generado por el módulo boot
COPY --from=build /app/gohostdelivery-service-app-boot/target/*.jar app.jar

# Puerto expuesto (Render inyecta $PORT automáticamente)
EXPOSE 8080

# Activamos el perfil preproduccion al arrancar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=preproduccion", "app.jar"]
