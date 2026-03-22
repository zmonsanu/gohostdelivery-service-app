-- Migración para crear la tabla de asociación zone_riders
CREATE TABLE IF NOT EXISTS zone_riders (
    id_zone_rider UUID PRIMARY KEY,
    id_zone       UUID NOT NULL,
    id_rider      UUID NOT NULL,
    fecha_asignacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_zone_riders_zone FOREIGN KEY (id_zone) REFERENCES zones (id_zone) ON DELETE CASCADE,
    CONSTRAINT fk_zone_riders_rider FOREIGN KEY (id_rider) REFERENCES riders (id) ON DELETE CASCADE,
    CONSTRAINT uq_zone_rider UNIQUE (id_zone, id_rider)
);
