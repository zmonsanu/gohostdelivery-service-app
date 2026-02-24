---
description: Guía de replicación del entorno de PREPRODUCCIÓN usando Cloud Shell
---

Este documento contiene los comandos para replicar exactamente el entorno que tenemos ahora en Preproducción.

### 1. Variables de Entorno (Versión Pre)
```bash
export PROJECT_ID="project-1f43bc6d-114e-44c8-bf4"
export REGION="europe-southwest1"
export DB_PASSWORD="la-password-que-usamos"
export SA_NAME="gohost-pre-sa"
```

### 2. Tópicos y Suscripciones (Lo que la App espera)
// turbo
```bash
# Crear el tópico de pedidos
gcloud pubsub topics create order-created

# Crear la suscripción para el microservicio de notificaciones
gcloud pubsub subscriptions create notification-service --topic=order-created
```

### 3. Base de Datos Cloud SQL
// turbo
```bash
# Crear la instancia (si no existiera)
gcloud sql instances create gohost-bd-pre \
    --database-version=POSTGRES_15 \
    --tier=db-f1-micro \
    --region=$REGION

# El nombre de la base de datos debe ser 'postgres'
gcloud sql databases create postgres --instance=gohost-bd-pre
```

### 4. Secret Manager (Crítico para Cloud Build)
Tu `cloudbuild.yaml` busca la contraseña aquí:
// turbo
```bash
echo -n "$DB_PASSWORD" | gcloud secrets create gohost-db-password --data-file=-
```

### 5. Permisos IAM necesarios
Para que Cloud Run pueda hablar con la DB y Pub/Sub:
// turbo
```bash
# Dar permiso a la cuenta de servicio por defecto de Cloud Run (o la personalizada)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export RUN_SA="$PROJECT_NUMBER-compute@developer.gserviceaccount.com"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$RUN_SA" \
    --role="roles/cloudsql.client"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$RUN_SA" \
    --role="roles/pubsub.subscriber"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$RUN_SA" \
    --role="roles/pubsub.publisher"
```
