-- ============================================================
--  ENUMS
-- ============================================================

DO $$ BEGIN
    CREATE TYPE tipo_preferencia AS ENUM ('FAVORITO', 'PREFERENTE');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
    CREATE TYPE tipo_documento AS ENUM ('PROFILE_PHOTO', 'CONTRACT', 'ID_DOCUMENT');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
    CREATE TYPE order_status AS ENUM ('RECIBIDO', 'EN_PROCESO', 'ENTREGADO');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- ============================================================
--  CITIES (debe crearse antes que ZONES que la referencia)
-- ============================================================

CREATE TABLE IF NOT EXISTS cities (
    id UUID PRIMARY KEY,
    nombre TEXT NOT NULL,
    provincia TEXT NOT NULL,
    comunidad_autonoma TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_cities_provincia ON cities(provincia);

-- ============================================================
--  COMPANIES
-- ============================================================

CREATE TABLE IF NOT EXISTS companies (
    id UUID PRIMARY KEY,
    nombre_comercial TEXT NOT NULL,
    representante_legal TEXT NOT NULL,
    doc_identidad TEXT NOT NULL,
    direccion TEXT NOT NULL,
    municipio TEXT NOT NULL,
    provincia TEXT NOT NULL,
    telefono TEXT NOT NULL,
    email TEXT NOT NULL,
    web TEXT,
    activo BOOLEAN DEFAULT TRUE
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_companies_email ON companies(email);
CREATE INDEX IF NOT EXISTS idx_companies_activo ON companies(activo);

-- ============================================================
--  RIDERS
-- ============================================================

CREATE TABLE IF NOT EXISTS riders (
    id UUID PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    doc_identidad TEXT NOT NULL,
    direccion TEXT NOT NULL,
    municipio TEXT NOT NULL,
    provincia TEXT NOT NULL,
    telefono TEXT NOT NULL,
    email TEXT NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_riders_email ON riders(email);
CREATE INDEX IF NOT EXISTS idx_riders_activo ON riders(activo);

-- ============================================================
--  RIDER DOCUMENTS (metadatos)
-- ============================================================

CREATE TABLE IF NOT EXISTS rider_documents (
    id UUID PRIMARY KEY,
    rider_id UUID NOT NULL REFERENCES riders(id) ON DELETE CASCADE,
    tipo_documento tipo_documento NOT NULL,
    nombre_fichero TEXT NOT NULL,
    content_type TEXT NOT NULL,
    fecha_subida TIMESTAMP NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_rider_documents_rider ON rider_documents(rider_id);

-- ============================================================
--  RIDER DOCUMENT BLOBS (contenido binario)
-- ============================================================

CREATE TABLE IF NOT EXISTS rider_document_blobs (
    id UUID PRIMARY KEY,
    rider_document_id UUID NOT NULL REFERENCES rider_documents(id) ON DELETE CASCADE,
    contenido BYTEA NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_rider_document_blobs_doc ON rider_document_blobs(rider_document_id);

-- ============================================================
--  COMPANY–RIDER PREFERENCES
-- ============================================================

CREATE TABLE IF NOT EXISTS company_rider_preferences (
    id_preference UUID PRIMARY KEY,
    id_company UUID NOT NULL REFERENCES companies(id) ON DELETE CASCADE,
    id_rider UUID NOT NULL REFERENCES riders(id) ON DELETE CASCADE,
    tipo_preferencia tipo_preferencia NOT NULL,
    fecha_asignacion TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_company_rider_unique
    ON company_rider_preferences(id_company, id_rider);

CREATE INDEX IF NOT EXISTS idx_company_rider_company ON company_rider_preferences(id_company);
CREATE INDEX IF NOT EXISTS idx_company_rider_rider ON company_rider_preferences(id_rider);

-- ============================================================
--  ZONES
-- ============================================================

CREATE TABLE IF NOT EXISTS zones (
    id_zone UUID PRIMARY KEY,
    id_company UUID NOT NULL REFERENCES companies(id) ON DELETE CASCADE,
    id_city UUID NOT NULL REFERENCES cities(id),
    importe_zona_centro NUMERIC(10,2) NOT NULL,
    importe_zona_periferica NUMERIC(10,2) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_zones_company ON zones(id_company);
CREATE INDEX IF NOT EXISTS idx_zones_city ON zones(id_city);

-- ============================================================
--  ORDERS (PEDIDOS)
-- ============================================================

CREATE TABLE IF NOT EXISTS orders (
    id_pedido UUID PRIMARY KEY,
    numero_pedido TEXT NOT NULL,
    id_company UUID NOT NULL REFERENCES companies(id) ON DELETE RESTRICT,
    id_zone UUID REFERENCES zones(id_zone) ON DELETE SET NULL,
    id_rider UUID REFERENCES riders(id) ON DELETE RESTRICT,
    estado order_status NOT NULL DEFAULT 'RECIBIDO',
    fecha_creacion TIMESTAMP NOT NULL,
    fecha_entrega TIMESTAMP,
    lugar_entrega TEXT,
    pagado BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_orders_numero ON orders(numero_pedido);
CREATE INDEX IF NOT EXISTS idx_orders_company ON orders(id_company);
CREATE INDEX IF NOT EXISTS idx_orders_rider ON orders(id_rider);
CREATE INDEX IF NOT EXISTS idx_orders_zone ON orders(id_zone);
CREATE INDEX IF NOT EXISTS idx_orders_estado ON orders(estado);
CREATE INDEX IF NOT EXISTS idx_orders_fecha_creacion ON orders(fecha_creacion);
CREATE INDEX IF NOT EXISTS idx_orders_pagado ON orders(pagado);

-- ============================================================
--  DATA: CITIES
-- ============================================================

INSERT INTO cities (id, nombre, provincia, comunidad_autonoma) VALUES
(gen_random_uuid(), 'Álava', 'Álava', 'País Vasco'),
(gen_random_uuid(), 'Albacete', 'Albacete', 'Castilla-La Mancha'),
(gen_random_uuid(), 'Alicante', 'Alicante', 'Comunidad Valenciana'),
(gen_random_uuid(), 'Almería', 'Almería', 'Andalucía'),
(gen_random_uuid(), 'Ávila', 'Ávila', 'Castilla y León'),
(gen_random_uuid(), 'Badajoz', 'Badajoz', 'Extremadura'),
(gen_random_uuid(), 'Barcelona', 'Barcelona', 'Cataluña'),
(gen_random_uuid(), 'Burgos', 'Burgos', 'Castilla y León'),
(gen_random_uuid(), 'Cáceres', 'Cáceres', 'Extremadura'),
(gen_random_uuid(), 'Cádiz', 'Cádiz', 'Andalucía'),
(gen_random_uuid(), 'Castellón de la Plana', 'Castellón', 'Comunidad Valenciana'),
(gen_random_uuid(), 'Ciudad Real', 'Ciudad Real', 'Castilla-La Mancha'),
(gen_random_uuid(), 'Córdoba', 'Córdoba', 'Andalucía'),
(gen_random_uuid(), 'A Coruña', 'A Coruña', 'Galicia'),
(gen_random_uuid(), 'Cuenca', 'Cuenca', 'Castilla-La Mancha'),
(gen_random_uuid(), 'Girona', 'Girona', 'Cataluña'),
(gen_random_uuid(), 'Granada', 'Granada', 'Andalucía'),
(gen_random_uuid(), 'Guadalajara', 'Guadalajara', 'Castilla-La Mancha'),
(gen_random_uuid(), 'Huelva', 'Huelva', 'Andalucía'),
(gen_random_uuid(), 'Huesca', 'Huesca', 'Aragón'),
(gen_random_uuid(), 'Jaén', 'Jaén', 'Andalucía'),
(gen_random_uuid(), 'León', 'León', 'Castilla y León'),
(gen_random_uuid(), 'Lleida', 'Lleida', 'Cataluña'),
(gen_random_uuid(), 'Logroño', 'La Rioja', 'La Rioja'),
(gen_random_uuid(), 'Lugo', 'Lugo', 'Galicia'),
(gen_random_uuid(), 'Madrid', 'Madrid', 'Comunidad de Madrid'),
(gen_random_uuid(), 'Málaga', 'Málaga', 'Andalucía'),
(gen_random_uuid(), 'Murcia', 'Murcia', 'Región de Murcia'),
(gen_random_uuid(), 'Ourense', 'Ourense', 'Galicia'),
(gen_random_uuid(), 'Oviedo', 'Asturias', 'Principado de Asturias'),
(gen_random_uuid(), 'Palencia', 'Palencia', 'Castilla y León'),
(gen_random_uuid(), 'Palma de Mallorca', 'Islas Baleares', 'Islas Baleares'),
(gen_random_uuid(), 'Las Palmas de Gran Canaria', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Pamplona', 'Navarra', 'Navarra'),
(gen_random_uuid(), 'Pontevedra', 'Pontevedra', 'Galicia'),
(gen_random_uuid(), 'Salamanca', 'Salamanca', 'Castilla y León'),
(gen_random_uuid(), 'San Sebastián', 'Guipúzcoa', 'País Vasco'),
(gen_random_uuid(), 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Santander', 'Cantabria', 'Cantabria'),
(gen_random_uuid(), 'Segovia', 'Segovia', 'Castilla y León'),
(gen_random_uuid(), 'Sevilla', 'Sevilla', 'Andalucía'),
(gen_random_uuid(), 'Soria', 'Soria', 'Castilla y León'),
(gen_random_uuid(), 'Tarragona', 'Tarragona', 'Cataluña'),
(gen_random_uuid(), 'Teruel', 'Teruel', 'Aragón'),
(gen_random_uuid(), 'Toledo', 'Toledo', 'Castilla-La Mancha'),
(gen_random_uuid(), 'Valencia', 'Valencia', 'Comunidad Valenciana'),
(gen_random_uuid(), 'Valladolid', 'Valladolid', 'Castilla y León'),
(gen_random_uuid(), 'Vitoria-Gasteiz', 'Álava', 'País Vasco'),
(gen_random_uuid(), 'Zamora', 'Zamora', 'Castilla y León'),
(gen_random_uuid(), 'Zaragoza', 'Zaragoza', 'Aragón');

INSERT INTO cities (id, nombre, provincia, comunidad_autonoma) VALUES
(gen_random_uuid(), 'Telde', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Santa Lucía de Tirajana', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'San Bartolomé de Tirajana', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Arrecife', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Puerto del Rosario', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Arucas', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Ingenio', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Agüimes', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Gáldar', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Teguise', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Tías', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'San Bartolomé', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Mogán', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'La Oliva', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Pájara', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Yaiza', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Haría', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Tinajo', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Betancuria', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Firgas', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Moya', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Santa Brígida', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Teror', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Valleseco', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Valsequillo de Gran Canaria', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Vega de San Mateo', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Tejeda', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Artenara', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Agaete', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'La Aldea de San Nicolás', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Antigua', 'Las Palmas', 'Canarias'),
(gen_random_uuid(), 'Tuineje', 'Las Palmas', 'Canarias');

INSERT INTO cities (id, nombre, provincia, comunidad_autonoma) VALUES
(gen_random_uuid(), 'San Cristóbal de La Laguna', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Arona', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Adeje', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Granadilla de Abona', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Los Realejos', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'La Orotava', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Puerto de la Cruz', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'San Miguel de Abona', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Icod de los Vinos', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Guía de Isora', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Candelaria', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Tacoronte', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'La Victoria de Acentejo', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'La Matanza de Acentejo', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'El Rosario', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'El Sauzal', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Tegueste', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Santiago del Teide', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Fasnia', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Güímar', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Arafo', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Arico', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Vilaflor de Chasna', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Los Silos', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Garachico', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Buenavista del Norte', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'La Guancha', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'San Juan de la Rambla', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Santa Úrsula', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'El Tanque', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Valle Gran Rey', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Vallehermoso', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Agulo', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Hermigua', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Alajeró', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'San Sebastián de La Gomera', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Frontera', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Valverde', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'El Pinar de El Hierro', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Breña Alta', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Breña Baja', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Santa Cruz de La Palma', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Los Llanos de Aridane', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'El Paso', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Tazacorte', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Puntallana', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'San Andrés y Sauces', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Barlovento', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Garafía', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Fuencaliente de La Palma', 'Santa Cruz de Tenerife', 'Canarias'),
(gen_random_uuid(), 'Villa de Mazo', 'Santa Cruz de Tenerife', 'Canarias');
