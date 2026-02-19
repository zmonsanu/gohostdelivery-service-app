# gohostdelivery-service-app Project 
Spring Boot 3.4.2 - Hexagonal Architecture with Maven modules 


                    ┌──────────────────────────┐
                    │     Clientes móviles      │
                    │   iOS / Android / Web     │
                    └─────────────┬────────────┘
                                  │ HTTPS público
                                  ▼
                      ┌──────────────────────┐
                      │     App Service      │
                      │  API pública (REST)  │
                      └──────────┬───────────┘
                                 │ VNet Integration (privado)
                                 ▼
        ┌──────────────────────────────────────────────────────────┐
        │                          VNet                            │
        │                                                          │
        │   ┌────────────────┐   ┌──────────────────┐             │
        │   │ PostgreSQL     │   │ Event Hub         │             │
        │   │ Private EP     │   │ Private EP        │             │
        │   └────────────────┘   └──────────────────┘             │
        │                                                          │
        │   ┌────────────────┐                                     │
        │   │ Storage Account│                                     │
        │   │ Private EP     │                                     │
        │   └────────────────┘                                     │
        └──────────────────────────────────────────────────────────┘
