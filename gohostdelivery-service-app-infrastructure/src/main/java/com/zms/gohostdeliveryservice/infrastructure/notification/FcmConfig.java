package com.zms.gohostdeliveryservice.infrastructure.notification;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

/**
 * Configuración de Firebase Admin SDK.
 *
 * En Cloud Run / GCP usa Application Default Credentials (ADC) automáticamente:
 * → No necesita fichero de credenciales; usa la Service Account del contenedor.
 *
 * En local, configura la variable de entorno:
 * GOOGLE_APPLICATION_CREDENTIALS=/ruta/a/tu/firebase-service-account.json
 * (descárgalo desde Firebase Console → Configuración → Cuentas de servicio)
 */
@Slf4j
@Configuration
@ConditionalOnProperty(name = "gohost.fcm.enabled", havingValue = "true")
public class FcmConfig {

    @org.springframework.beans.factory.annotation.Value("${gohost.fcm.project-id:}")
    private String projectId;

    @Bean
    public FirebaseApp firebaseApp() throws IOException {
        if (!FirebaseApp.getApps().isEmpty()) {
            return FirebaseApp.getInstance();
        }

        FirebaseOptions.Builder optionsBuilder = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.getApplicationDefault());

        if (projectId != null && !projectId.isEmpty()) {
            optionsBuilder.setProjectId(projectId);
        }

        FirebaseApp app = FirebaseApp.initializeApp(optionsBuilder.build());
        log.info("Firebase Admin SDK inicializado correctamente");
        return app;
    }
}
