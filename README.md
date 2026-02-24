# GoHost Delivery Service - Backend

Proyecto Spring Boot 3.4.2 basado en Arquitectura Hexagonal y desplegado en Google Cloud Platform (GCP).

## Arquitectura de Preproducción (GCP)

La infraestructura en el entorno de `preproduccion` está diseñada para ser escalable y segura, utilizando servicios gestionados de Google Cloud:

```text
                     ┌──────────────────────────┐
                     │   App Móvil (Frontend)   │
                     │    Firebase Messaging    │
                     └─────────────┬────────────┘
                                   │ HTTPS (público)
                                   ▼
                       ┌──────────────────────┐
                       │   Google Cloud Run   │
                       │  (Docker Container)  │
                       └───────────┬──────────┘
                                   │
         ┌─────────────────────────┼─────────────────────────┐
         │                         │                         │
         ▼                         ▼                         ▼
 ┌───────────────┐         ┌───────────────┐         ┌────────────────┐
 │   Cloud SQL   │         │ Cloud Pub/Sub │         │ Firebase (FCM) │
 │ (PostgreSQL)  │         │ (Topic: order)│         │ Project: c060e │
 └───────────────┘         └───────────────┘         └────────────────┘
         │                         │
   Socket Factory             Async Events
   (Secure Conn)             (Queued Notif)
```

### Componentes de Infraestructura

1.  **Google Cloud Run**: Servicio principal donde corre la aplicación empaquetada en un contenedor Docker. 
    - Puerto: `8080`.
    - Perfil activo: `preproduccion`.
    - Escalado: Gestionado automáticamente por GCP.

2.  **Google Cloud SQL (PostgreSQL)**: Base de datos gestionada.
    - Conexión: Se utiliza el driver **Socket Factory** para evitar el uso de IPs públicas y gestionar la seguridad mediante IAM.
    - Base de datos: `postgres`.

3.  **Google Cloud Pub/Sub**: Bus de mensajes para la comunicación interna.
    - Utilizado por **Spring Cloud Stream** para el encolamiento asíncrono.
    - Topic: `order-created`.
    - Suscripción: `notification-service`.

4.  **Firebase Cloud Messaging (FCM)**:
    - Proyecto: `gohostdelivery-c060e`.
    - Uso: Envío de notificaciones push a conductores (Riders) y establecimientos.
    - Arquitectura: El envío se procesa de forma asíncrona mediante un consumidor de eventos Pub/Sub para no bloquear el flujo principal.

5.  **Seguridad y Secretos**:
    - **Secret Manager**: Las contraseñas críticas (como `DB_PASSWORD`) se inyectan en tiempo de ejecución desde Secret Manager.
    - **IAM**: Los permisos de acceso se gestionan mediante la Service Account del proyecto.

## Despliegue (CI/CD)

El despliegue está automatizado mediante **Google Cloud Build** (`cloudbuild.yaml`):

1.  **Compilación**: Maven construye el JAR.
2.  **Docker**: Se genera la imagen y se sube a Artifact Registry.
3.  **Deploy**: Se despliega la nueva revisión en Cloud Run inyectando las variables de entorno necesarias.

---
*Este proyecto utiliza el perfil `local` con Kafka para desarrollo y `preproduccion` con servicios de Google Cloud para el entorno de staging/pre.*
