-- Migración para añadir soporte de rangos numéricos a la tabla streets
ALTER TABLE streets ADD COLUMN IF NOT EXISTS num_min INT;
ALTER TABLE streets ADD COLUMN IF NOT EXISTS num_max INT;

-- Eliminar el índice de unicidad anterior si existe
DROP INDEX IF EXISTS idx_streets_city_nombre;

-- Crear el nuevo índice de unicidad que incluye los rangos numéricos
CREATE UNIQUE INDEX IF NOT EXISTS idx_streets_city_nombre_rango ON streets(id_city, nombre, num_min, num_max);
