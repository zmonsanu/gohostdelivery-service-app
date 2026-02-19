# ─────────────────────────────────────────
# STAGE 1: BUILD
# ─────────────────────────────────────────
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copiamos todo el código fuente de una vez.
# En proyectos multi-módulo Maven los módulos internos no existen en repositorios
# externos, por lo que NO se puede usar dependency:go-offline — Maven debe
# compilarlos en orden según las dependencias declaradas en los pom.xml.
COPY . .

# Compilamos todos los módulos en orden y empaquetamos saltando tests
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
