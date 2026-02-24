-- Migración para añadir el campo descripcion a la tabla zones
ALTER TABLE zones ADD COLUMN IF NOT EXISTS descripcion VARCHAR(500);
