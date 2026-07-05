-- Script de migración para eliminar la restricción de unicidad en la columna numero_pedido de la tabla orders.
-- Esto permite que los tickets diarios secuenciales de PizzaGest (como "605", "606") puedan repetirse en días distintos.

-- 1. Eliminar el índice único existente
DROP INDEX IF EXISTS idx_orders_numero;

-- 2. Crear un índice no único para mantener las búsquedas rápidas en el frontend por número de pedido
CREATE INDEX IF NOT EXISTS idx_orders_numero ON orders(numero_pedido);
