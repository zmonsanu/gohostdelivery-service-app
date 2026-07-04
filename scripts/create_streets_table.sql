-- ============================================================
--  STREETS
-- ============================================================

CREATE TABLE IF NOT EXISTS streets (
    id UUID PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_city UUID NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
    id_zone UUID REFERENCES zones(id_zone) ON DELETE SET NULL,
    num_min INT,
    num_max INT
);

-- Índices para optimizar las consultas y búsquedas
CREATE INDEX IF NOT EXISTS idx_streets_city ON streets(id_city);
CREATE INDEX IF NOT EXISTS idx_streets_zone ON streets(id_zone);

-- Restricción de unicidad para evitar registros duplicados de calle con el mismo rango en la misma ciudad
CREATE UNIQUE INDEX IF NOT EXISTS idx_streets_city_nombre_rango ON streets(id_city, nombre, num_min, num_max);
