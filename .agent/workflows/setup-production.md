---
description: Guía de creación de infraestructura para PRODUCCIÓN usando Cloud Shell
---

Este documento contiene los comandos necesarios para replicar la infraestructura en un nuevo proyecto de GCP (Producción) de forma automatizada.

### 1. Variables de Entorno
Configura estas variables antes de empezar:
```bash
export PROJECT_ID="tu-proyecto-prod"
export REGION="europe-southwest1"
export DB_PASSWORD="pon-una-password-segura"
export SA_NAME="gohost-app-sa"
```

### 2. Habilitar Servicios de Google Cloud
// turbo
```bash
gcloud services enable \
    run.googleapis.com \
    sqladmin.googleapis.com \
    pubsub.googleapis.com \
    cloudbuild.googleapis.com \
    artifactregistry.googleapis.com \
    firebase.googleapis.com
```

### 3. Crear Base de Datos Cloud SQL (PostgreSQL)
// turbo
```bash
gcloud sql instances create gohost-db \
    --database-version=POSTGRES_15 \
    --tier=db-f1-micro \
    --region=$REGION \
    --root-password=$DB_PASSWORD

gcloud sql databases create postgres --instance=gohost-db
```

### 4. Configurar Pub/Sub
// turbo
```bash
gcloud pubsub topics create order-created
gcloud pubsub subscriptions create notification-service --topic=order-created
```

### 5. Configurar IAM (Seguridad)
// turbo
```bash
# Crear Service Account para la aplicación
gcloud iam service-accounts create $SA_NAME --display-name="App Service Account"

# Asignar roles necesarios
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/cloudsql.client"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/pubsub.subscriber"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/pubsub.publisher"
```

### 6. Firebase (Vincular al proyecto)
Este paso requiere la herramienta de Firebase instalada:
```bash
firebase projects:add-firebase $PROJECT_ID
```

### 7. Despliegue en Cloud Run
Una vez tengas la imagen en Artifact Registry (vía Cloud Build):
```bash
gcloud run deploy gohostdelivery-service \
    --image=$REGION-docker.pkg.dev/$PROJECT_ID/repo/gohost-app:latest \
    --service-account=$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com \
    --set-env-vars="SPRING_PROFILES_ACTIVE=produccion,DB_PASSWORD=$DB_PASSWORD" \
    --add-cloudsql-instances=$PROJECT_ID:$REGION:gohost-db \
    --region=$REGION \
    --allow-unauthenticated
```
