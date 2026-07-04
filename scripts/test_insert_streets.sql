-- ===========================================================
-- SQL Generado automáticamente para la ciudad: Vecindario
-- Total Zonas: 17 | Total Calles: 667
-- ===========================================================

DO $$
DECLARE
    v_company_id UUID := 'd1d52a29-c42d-48c6-918b-626009d52979';
    v_city_id UUID := '6edfe63f-948c-5880-84ac-3ad58ebad281';
    v_zone_id_arinaga_b29d6cc3 UUID := '73c664b5-be74-5e56-a0f3-5a014fdb6f02';
    v_zone_id_casapastores1_c946704e UUID := '71267e7b-4844-59a7-88ee-6b7cd6dbe511';
    v_zone_id_casapastores2_25add61a UUID := '39a99f7c-9202-5d48-abbb-caada8204a23';
    v_zone_id_doctoralalto_fe3a6961 UUID := '96cabcaf-3e30-5c99-a809-ff1d1a26f9b4';
    v_zone_id_doctoralbajo_57e6a3a6 UUID := 'abd4f640-2d22-5971-b943-e9b59084b70d';
    v_zone_id_doctoralviejo_e3590551 UUID := 'da1b4849-a6a2-5d5a-9a91-b880f5e0504b';
    v_zone_id_elcanario_35740b41 UUID := 'bbe86280-427a-560d-9da5-a8ba7f786525';
    v_zone_id_elcruce_a875d265 UUID := '59c3670c-243f-51cb-aa64-cd862256c1a6';
    v_zone_id_labarriada_8bfc609f UUID := '113112c7-5d5e-582b-9cfa-d9a55c4fe6ca';
    v_zone_id_lablanca_18267716 UUID := '43614b10-3117-50ae-8400-ebf3d182da5f';
    v_zone_id_losllanos_1c6c4533 UUID := '1a916672-07c9-55bf-ad68-aafc923f185e';
    v_zone_id_orillabaja_593aed8d UUID := 'a58c3218-a54e-5524-a4b5-144996c5b031';
    v_zone_id_pozoizquierdo_32493452 UUID := '913aec8d-c682-5350-8de9-2c699b396ce1';
    v_zone_id_sardina_1e0d0551 UUID := '03f21856-06c8-5a26-827c-a760c3a68373';
    v_zone_id_vecindario_e077887e UUID := '8df0eb9e-b354-57ca-981b-481eb92e066d';
    v_zone_id_vecindario2_9c645546 UUID := '0527d18a-d9b0-55c8-a017-6049c4ccb005';
    v_zone_id_vecindariozona1_24e6285c UUID := '4073a977-a947-560c-8f55-a70a254fd608';
BEGIN
    -- Obtener la primera compañía disponible en el sistema
    --SELECT id INTO v_company_id FROM companies LIMIT 1;
    --IF v_company_id IS NULL THEN
    --    RAISE EXCEPTION 'No se encontró ninguna compañía registrada en la tabla "companies". Por favor, crea una compañía primero.';
    --END IF;

    -- 1. Insertar Ciudad (Vecindario)
    INSERT INTO cities (id, nombre, provincia, comunidad_autonoma)
    VALUES (v_city_id, 'Vecindario', 'Las Palmas', 'Canarias')
    ON CONFLICT (id) DO NOTHING;

    -- 2. Insertar Zonas
    -- Zona: ARINAGA
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_arinaga_b29d6cc3, v_company_id, v_city_id, 3.50, 5.00, 'Zona ARINAGA en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: CASA PASTORES 1
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_casapastores1_c946704e, v_company_id, v_city_id, 3.50, 5.00, 'Zona CASA PASTORES 1 en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: CASA PASTORES 2
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_casapastores2_25add61a, v_company_id, v_city_id, 3.50, 5.00, 'Zona CASA PASTORES 2 en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: DOCTORAL ALTO
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_doctoralalto_fe3a6961, v_company_id, v_city_id, 3.50, 5.00, 'Zona DOCTORAL ALTO en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: DOCTORAL BAJO
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_doctoralbajo_57e6a3a6, v_company_id, v_city_id, 3.50, 5.00, 'Zona DOCTORAL BAJO en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: DOCTORAL VIEJO
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_doctoralviejo_e3590551, v_company_id, v_city_id, 3.50, 5.00, 'Zona DOCTORAL VIEJO en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: EL CANARIO
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_elcanario_35740b41, v_company_id, v_city_id, 3.50, 5.00, 'Zona EL CANARIO en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: EL CRUCE
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_elcruce_a875d265, v_company_id, v_city_id, 3.50, 5.00, 'Zona EL CRUCE en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: LA BARRIADA
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_labarriada_8bfc609f, v_company_id, v_city_id, 3.50, 5.00, 'Zona LA BARRIADA en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: LA BLANCA
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_lablanca_18267716, v_company_id, v_city_id, 3.50, 5.00, 'Zona LA BLANCA en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: LOS LLANOS
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_losllanos_1c6c4533, v_company_id, v_city_id, 3.50, 5.00, 'Zona LOS LLANOS en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: ORILLA BAJA
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_orillabaja_593aed8d, v_company_id, v_city_id, 3.50, 5.00, 'Zona ORILLA BAJA en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: POZO IZQUIERDO
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_pozoizquierdo_32493452, v_company_id, v_city_id, 3.50, 5.00, 'Zona POZO IZQUIERDO en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: SARDINA
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_sardina_1e0d0551, v_company_id, v_city_id, 3.50, 5.00, 'Zona SARDINA en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: VECINDARIO
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_vecindario_e077887e, v_company_id, v_city_id, 3.50, 5.00, 'Zona VECINDARIO en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: VECINDARIO 2
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_vecindario2_9c645546, v_company_id, v_city_id, 3.50, 5.00, 'Zona VECINDARIO 2 en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- Zona: VECINDARIO ZONA 1
    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)
    VALUES (v_zone_id_vecindariozona1_24e6285c, v_company_id, v_city_id, 3.50, 5.00, 'Zona VECINDARIO ZONA 1 en Vecindario')
    ON CONFLICT (id_zone) DO NOTHING;

    -- 3. Insertar Calles con sus rangos y zonas asociadas
    -- Calle: AV LOS PESCADORES (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c90e5948-a853-558c-8f4e-894ad05d143b', 'AV LOS PESCADORES', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AV POLIZON (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('73850825-5b32-5ee2-adbe-fedf4aa1571d', 'AV POLIZON', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALCALA GALIANO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('fcde9a9f-79d2-5964-812c-d1fc50925660', 'CALLE ALCALA GALIANO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALMIRANTE ARRIAGA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ac0a5010-360b-5e68-a274-bab137f2f207', 'CALLE ALMIRANTE ARRIAGA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALMIRANTE DIAZ DEL RIO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4b03f44f-1f61-5dce-8b4d-300e313f7d84', 'CALLE ALMIRANTE DIAZ DEL RIO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALMIRANTE ESCRIGAS (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('aac6aaac-cef9-5dc3-9d9d-015829512f73', 'CALLE ALMIRANTE ESCRIGAS', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALMIRANTE PASTOR TOMASETI (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9c382d9f-cd9b-5f83-b563-e31a480a26fd', 'CALLE ALMIRANTE PASTOR TOMASETI', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALMIRANTE YUSTI PITA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3486aed2-2ef4-5c4e-a428-910de429b215', 'CALLE ALMIRANTE YUSTI PITA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALVARO DE BAZAN (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d254634a-d603-5c87-9169-fb4abfb0c006', 'CALLE ALVARO DE BAZAN', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ALVARO DE MENDAÑO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('172e424c-d60e-5074-8ae1-d2cf95994931', 'CALLE ALVARO DE MENDAÑO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ANDREA DORIA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b2f81e7f-ea72-543c-a619-53ff69027f73', 'CALLE ANDREA DORIA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ANDRES DE URDANETA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('565be6a3-52e6-521a-a77e-41cdbabf0a68', 'CALLE ANDRES DE URDANETA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ANTONIO DE OQUENDO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('04faeb6b-fc66-5226-9d6d-e98c2eb11f57', 'CALLE ANTONIO DE OQUENDO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ARENQUE (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('95e5a85e-9891-5a2a-95a4-eb989540b7cb', 'CALLE ARENQUE', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE BAUTISTA ANTEQUERA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('df576af8-0207-5e37-af0c-15eb16f57bcc', 'CALLE BAUTISTA ANTEQUERA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE BLAS DE LEZO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('caca59a9-fbf8-5e45-bc41-b0461217a2d9', 'CALLE BLAS DE LEZO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE BOGA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('37dda3ba-33a8-5455-b42e-0ad12c579c06', 'CALLE BOGA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE BRECA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8b583eda-1f3a-513b-9f3b-2cb495830711', 'CALLE BRECA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE CHURRUCA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e5278159-b524-5a23-a6d5-30c532861c20', 'CALLE CHURRUCA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE COLON (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d64c8402-c16b-5eee-97e9-3de244fa433b', 'CALLE COLON', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DE LA CARNA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('809c1edd-b90b-5ab1-81fb-1d6bb7c5f29c', 'CALLE DE LA CARNA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DE LA FIJA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ee9847b0-98b4-520b-b216-1bd132644484', 'CALLE DE LA FIJA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DE TICHLA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c100a00b-7768-563b-9558-82e37878ebb3', 'CALLE DE TICHLA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DEL ANCLA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4d9c6025-8b2d-5eb4-a878-eed7238a43b1', 'CALLE DEL ANCLA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DEL ANZUELO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e3aaea34-8ff5-58e0-ac10-5514b144e463', 'CALLE DEL ANZUELO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DEL PALANGRE (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('de85bf3f-1989-55f2-9cdc-3f153220191c', 'CALLE DEL PALANGRE', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DEL REMO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f903dabf-836a-5246-a55e-e8b34ad7ecc4', 'CALLE DEL REMO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DOMINGO MONTEVERDE (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8b71bb3c-2b36-52e2-92cc-72a48b4c4ab9', 'CALLE DOMINGO MONTEVERDE', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE DUQUE DE OSUNA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('dddceadf-a0e9-5f59-97e1-de2163596419', 'CALLE DUQUE DE OSUNA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE EL CANO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('766f97ff-d680-5772-99b3-28ec7af0bd68', 'CALLE EL CANO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE FEIJOO DE SOTO MAYOR (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d36a2813-8c72-54b0-8d09-cdd3c466e765', 'CALLE FEIJOO DE SOTO MAYOR', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE FERNANDO VILLAMIL (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a76837b1-7d80-5f81-bbd9-3c9e0398542f', 'CALLE FERNANDO VILLAMIL', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE FULA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('16e03431-8284-5372-8418-b8e6b67354f8', 'CALLE FULA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE GARCIA DE TOLEDO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b425141b-b30d-5e76-bd47-4f057f600dde', 'CALLE GARCIA DE TOLEDO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE GRAVINA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('42384d8f-a8c0-5c8d-b532-862e55c780bf', 'CALLE GRAVINA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE GUELDE (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('92535cc7-16c0-5cbc-bc50-4365379fc0a2', 'CALLE GUELDE', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE JAIME JANER (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0a15b4e9-690e-538e-be29-8cf9d8cb6b84', 'CALLE JAIME JANER', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE JORGE JUAN (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('30ecb129-6861-521a-bb76-f8daffa5c875', 'CALLE JORGE JUAN', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE JUAN DE AUSTRIA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('001fd39d-29eb-55d9-9b54-7b85d2fceab3', 'CALLE JUAN DE AUSTRIA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE JUAN DE CARDONA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e8c8c638-20d4-500b-92ed-8b18057c2a6f', 'CALLE JUAN DE CARDONA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE JUAN DE LA COSA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b77848dc-d089-581d-9ccb-ef582e8e1ddc', 'CALLE JUAN DE LA COSA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE JUAN LAZAGA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('45376ffa-a4af-5a1d-bd57-1c66ebad4594', 'CALLE JUAN LAZAGA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE JUREL (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c6b2b72b-aa58-57de-bcb0-812757db3c0b', 'CALLE JUREL', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE LAS MIMOSAS (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cb9938a2-439c-5af0-97e2-2c34f29b4e63', 'CALLE LAS MIMOSAS', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE LAS NASAS (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ae52d818-63d1-5449-8136-e9856ef08bec', 'CALLE LAS NASAS', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE LOPE DE HOCES (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b455a9dd-1768-5dca-8a77-aaa3dd29906a', 'CALLE LOPE DE HOCES', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE LOPEZ DE LEGAZPI (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('672be443-e356-51e2-b3c6-300c374a3d01', 'CALLE LOPEZ DE LEGAZPI', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE LOPEZ DE ORDUÑA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ff6d74f5-6cc7-5d81-8fa0-83788f649cd7', 'CALLE LOPEZ DE ORDUÑA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE LUIS VELASCO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a8659813-5ac7-5594-a247-305c40a9f017', 'CALLE LUIS VELASCO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE MAGALLANES (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9e222be8-0705-5a4b-aa2a-4978db4d176a', 'CALLE MAGALLANES', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE MEDREGAL (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('08ee5993-e1ac-55c4-a609-849c9c709ad3', 'CALLE MEDREGAL', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE MENDEZ NUÑEZ (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8e14625c-3b57-5b1c-9a13-400394165f24', 'CALLE MENDEZ NUÑEZ', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE MERO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3a4052d0-6e9e-55bc-8763-b59b34a70c81', 'CALLE MERO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ORDOÑEZ MAPELLI (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7e8453b1-3258-55c5-9d91-8af95be6c571', 'CALLE ORDOÑEZ MAPELLI', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE RAFAEL CLAVIJO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cf25622c-9d0f-54b6-81e8-82673b1b5101', 'CALLE RAFAEL CLAVIJO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE RAMON BONIFAZ (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9bee840a-df5f-5805-92a0-39d7bc795630', 'CALLE RAMON BONIFAZ', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE ROGER DE LAURIA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1a1c4f0a-8604-5fde-b4eb-f50b430ec315', 'CALLE ROGER DE LAURIA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE SAL (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('67177e0d-1e70-585b-a753-556f18fd896d', 'CALLE SAL', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE SALEMA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cd3c0c7b-b39f-5d79-b31f-9095a3a17e81', 'CALLE SALEMA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE SARGO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('56496ee2-a30c-5be4-b55a-9a636b392047', 'CALLE SARGO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE SARMIENTO DE GAMBOA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('15b4f85f-9e08-5628-b680-05a7416b3cec', 'CALLE SARMIENTO DE GAMBOA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE TIMON (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a77c717a-be07-5530-a4f8-bc95022d695e', 'CALLE TIMON', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE VIEJA (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d2f4f633-29bc-5d88-9c9d-42abd70c3252', 'CALLE VIEJA', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE WENCESLAO BENITEZ (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d31e3fea-21b1-5ded-b543-338644daf425', 'CALLE WENCESLAO BENITEZ', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PASEO DEL FARO (Zona: ARINAGA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e68820a4-1c2e-5107-8ac0-18095e854598', 'PASEO DEL FARO', v_city_id, v_zone_id_arinaga_b29d6cc3, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ACEBUCHE (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('99d558dc-92d3-5272-8df9-d36c3dc97dc0', 'ACEBUCHE', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AGUSTIN DE ZURBARAN (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7fc42623-1e0f-5b4c-9da1-e0c8c00c5a95', 'AGUSTIN DE ZURBARAN', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DE CANARIAS (Zona: LA BARRIADA, Rango: 1 - 120)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f74184a8-431e-5c8f-9f94-b08324a167cc', 'AVENIDA DE CANARIAS', v_city_id, v_zone_id_labarriada_8bfc609f, 1, 120)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DEL ATLANTICO (Zona: LA BARRIADA, Rango: 701 - 900)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9d2e2fe1-b3ba-5b1e-b703-d4ffa6c906d4', 'AVENIDA DEL ATLANTICO', v_city_id, v_zone_id_labarriada_8bfc609f, 701, 900)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BILBAO (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('549e34d7-0f91-5c1f-9bc7-99ad97be6f87', 'BILBAO', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ESCOBON (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f1001d1a-3c93-50ce-bc30-5a0dd4c6b513', 'ESCOBON', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EXTREMADURA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('638299b4-e43c-5806-8527-5a6acc17f538', 'EXTREMADURA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GALICIA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1c00ec49-c9e9-53c9-a67e-b9633c9bf4dc', 'GALICIA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GENERAL PRIM (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b720fb0a-4016-5195-a9bb-aa9ef0ffdf9b', 'GENERAL PRIM', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GOYA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e686ba7c-e85d-5ef6-a247-86a0e9adcf8c', 'GOYA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GRANADA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8b1a4fb7-c63c-5b43-a87e-d15a4b19b3e6', 'GRANADA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LANZAROTE (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8ace7cef-ca80-501d-96cf-d53da55950d8', 'LANZAROTE', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LERIDA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5350133c-0e87-539e-985f-a5bb4fe68cc7', 'LERIDA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LLANTEN (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f4408d54-695c-5516-8925-9df4fc8dc8eb', 'LLANTEN', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MADROÑO (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('09cd2ad6-2584-5f6b-b74e-35b176fe62a6', 'MADROÑO', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MALLORCA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b4144576-a314-544f-b939-d340723f3543', 'MALLORCA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MOCAN (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('edac3fbf-948f-5fb4-9d00-c14fc3202224', 'MOCAN', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MURILLO (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e9800f06-e726-5bf2-8a88-e40f54f50adb', 'MURILLO', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NICOLAS ESTEVANEZ (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('85717b95-c33a-57da-bfa9-ba5a33fbd7cb', 'NICOLAS ESTEVANEZ', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: OLIVO (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c502eff0-05e2-5795-a581-59c6eb83a3ee', 'OLIVO', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PABLO NERUDA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0c41f13c-fcf8-5a55-ba37-d60ff2963d10', 'PABLO NERUDA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PICASSO (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a8e531e9-d916-5391-ba1b-f1a3fe352e19', 'PICASSO', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PROFESOR SVENTENIUS (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('52248f97-59d0-59bc-8bae-2c90ec937687', 'PROFESOR SVENTENIUS', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PUCCINI (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e1428830-5c2c-536b-8c67-6c5c2603123e', 'PUCCINI', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RELINCHON (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('66e54457-c203-575a-97a4-455b7667bc28', 'RELINCHON', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RIBERA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('117921c6-def1-592f-aca9-7c0ec5445b3d', 'RIBERA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAUCE (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9bae9ec1-419d-5c42-b464-379fa3591eca', 'SAUCE', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SEVILLA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('574b0c79-feee-57f0-98e4-29d3a4544e4b', 'SEVILLA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TENERIFE (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('52faab1a-0b2f-5ff6-afd8-19df96863f8f', 'TENERIFE', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TERUEL (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c99866a2-fa42-5442-a339-81241a140547', 'TERUEL', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VALLADOLID (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('238aedf7-2bc1-5f31-9287-f675867400cb', 'VALLADOLID', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VALENCIA (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9e83675b-0f26-50c3-a173-125a50fd8055', 'VALENCIA', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VEINTINUEVE DE ABRIL (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('37db4c0f-bc20-594f-abb0-05508a205f85', 'VEINTINUEVE DE ABRIL', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VEROL (Zona: LA BARRIADA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ce256ec3-3296-5024-9ac5-a02542fd0080', 'VEROL', v_city_id, v_zone_id_labarriada_8bfc609f, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AGUSTIN ESPINOSA (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7b94efc4-9cda-51e1-ab61-cb849c911267', 'AGUSTIN ESPINOSA', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALFREDO CALDERON (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8b4cfa35-1f4b-5cee-bfd8-04ec1718732e', 'ALFREDO CALDERON', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CAMINO DE LA MADERA (Zona: CASA PASTORES 1, Rango: 1 - 53)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bcbebf44-1a90-50ae-8b0e-c59f14e38375', 'CAMINO DE LA MADERA', v_city_id, v_zone_id_casapastores1_c946704e, 1, 53)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CAMINO LA MADERA (Zona: CASA PASTORES 1, Rango: 1 - 53)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e0c38abb-bf47-5f63-8f89-8062f93a452f', 'CAMINO LA MADERA', v_city_id, v_zone_id_casapastores1_c946704e, 1, 53)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CHILE (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6d951140-cc25-5f6f-a5ad-0422804c06bf', 'CHILE', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ECHEGARAY (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('45a54add-7b3d-57f2-b918-10029da167e1', 'ECHEGARAY', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARCIA LORCA (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f968bc83-0da7-5c46-82f6-16d3995de4da', 'GARCIA LORCA', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JOSE MARIA PEREDA (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d9bf1b5b-714e-5945-a59b-0c13dd700bfb', 'JOSE MARIA PEREDA', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA UNION (Zona: CASA PASTORES 1, Rango: 68 - 131)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7b7531f7-49ab-5c7d-9302-cee219f0e98b', 'LA UNION', v_city_id, v_zone_id_casapastores1_c946704e, 68, 131)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LEON Y JOVEN (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('571baa61-d851-5b33-8804-130fcaa82c3e', 'LEON Y JOVEN', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LUIS MOROTE (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cc2cd4a9-ad45-5ee1-9a20-878a635c0581', 'LUIS MOROTE', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MANUEL ALEMAN ALAMO (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c4de9461-9464-5f2b-adba-e4acc0057b9a', 'MANUEL ALEMAN ALAMO', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MIGUEL HERNANDEZ (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3c589503-8d09-5c50-aceb-5b5cfe714c35', 'MIGUEL HERNANDEZ', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PI Y MARGALL (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6e2209c2-d34d-51e4-9510-0484683fe1d6', 'PI Y MARGALL', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ROMERAL (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4b371b97-ee00-5a7a-91f4-187e80e19f43', 'ROMERAL', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TANAUSU (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('91a33c44-dfcb-5307-a930-88b207019ff3', 'TANAUSU', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TUFIA (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4e3e485b-779c-5b86-80ca-575a5da0a0ed', 'TUFIA', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VALPARAISO (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9db73e39-0c73-5784-b143-47603ac23f2b', 'VALPARAISO', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VICENTE ALEIXANDRE (Zona: CASA PASTORES 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('91a2a9aa-4735-5ae5-9757-69982d502835', 'VICENTE ALEIXANDRE', v_city_id, v_zone_id_casapastores1_c946704e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ACONCAGUA (Zona: CASA PASTORES 2, Rango: 1 - 50)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f9742420-bbc2-58bb-a240-1ee147959eba', 'ACONCAGUA', v_city_id, v_zone_id_casapastores2_25add61a, 1, 50)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANTONIO MACHADO (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('74679f52-f04c-5de5-a1d1-c158093c33f9', 'ANTONIO MACHADO', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA AÑEPA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7466e10f-2fb4-5a88-81c3-bda2cd799df6', 'AVENIDA AÑEPA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AYACATA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3ab580af-4de6-5dba-a3c1-24e4e994c3f1', 'AYACATA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BANDAMA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3aa5db05-156f-5446-8e55-fc5ac6e76448', 'BANDAMA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BUEN PASTOR (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d9f152d0-da24-5b32-b88c-fec2bff0b0ff', 'BUEN PASTOR', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CASA PASTORES (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b8aff559-8b45-59f0-b77e-e2172351be3d', 'CASA PASTORES', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DANIEL BEEFORE (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0d6dc9ea-44c3-5358-a552-03339fb552bb', 'DANIEL BEEFORE', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GALILEO GALILEI (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3d82bad9-f070-5e7d-a645-8bfa2805991d', 'GALILEO GALILEI', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: IDAFE (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b0a0ecf2-1721-5bc1-8ebb-7b4d8c42aa7c', 'IDAFE', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MATULA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c2df5a75-f758-51cf-ab81-6495da8affd8', 'MATULA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PEDRO INFINITO (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('97578d13-bc10-5d21-a9bf-c523e8552b31', 'PEDRO INFINITO', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RUBEN DARIO (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f8fc431d-a9c0-5cda-9d42-68f5e92e68f7', 'RUBEN DARIO', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RUIZ DE ALARCON (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('14038373-e864-5d19-b28e-2d3f24c96103', 'RUIZ DE ALARCON', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SILVA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8b31664f-3797-51f6-a71d-fa29b5b3e8f6', 'SILVA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TANAGUA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a2fedbec-ed0a-5287-b62b-c8dba2a4b0b0', 'TANAGUA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAYA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4fffa9f3-7d5d-5521-a9ba-3ed0f311a6db', 'TAYA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAZARTE (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4ddd67ba-8f08-585e-882c-c3e4f6c25ea9', 'TAZARTE', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TENTENIGUADA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1257ad29-6718-5f80-92d7-912875a62f9c', 'TENTENIGUADA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TIMANFAYA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f27fe63b-1ec5-55c5-b3f5-1242a6c61cac', 'TIMANFAYA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TIRSO DE MOLINA (Zona: CASA PASTORES 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('02686624-29ab-5966-8b6e-8852471682e5', 'TIRSO DE MOLINA', v_city_id, v_zone_id_casapastores2_25add61a, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ACHAMAN (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('59a28433-af97-50f0-91b9-410fefd16b3d', 'ACHAMAN', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ACUSA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bf051387-1ad1-530b-91b7-c3f3a6782833', 'ACUSA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AJUI (Zona: DOCTORAL ALTO, Rango: 0 - 100)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e2db07aa-dc76-584e-a954-ae75018062a4', 'AJUI', v_city_id, v_zone_id_doctoralalto_fe3a6961, 0, 100)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALCORAC (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('92a95fff-42d2-58e5-9d08-9eacf7fdfbdf', 'ALCORAC', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALONSO QUINTERO (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c7a5ee32-cc82-5e9a-ade1-aa23c116eecb', 'ALONSO QUINTERO', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANAGA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f9c8014a-f779-5bac-a938-70bed05bd69e', 'ANAGA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANDAMANA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('16812f14-0c1a-5e9a-a532-aaa34a9e3f24', 'ANDAMANA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANTONIO DE VIANA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4ab4b650-ff04-5583-8dd9-b59536e95e05', 'ANTONIO DE VIANA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ARTAMI (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f3a7c032-1470-5f2e-a838-e79cc9027a61', 'ARTAMI', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DE CANARIAS (Zona: DOCTORAL ALTO, Rango: 353 - 550)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f167e185-20be-5e50-b4ed-d20dd4fd53c5', 'AVENIDA DE CANARIAS', v_city_id, v_zone_id_doctoralalto_fe3a6961, 353, 550)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA TIRAJANA (Zona: DOCTORAL ALTO, Rango: 10 - 299)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0a545422-ed2e-5d29-ba8b-0f9b4ca8a3b1', 'AVENIDA TIRAJANA', v_city_id, v_zone_id_doctoralalto_fe3a6961, 10, 299)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BANOT (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5a077f52-e07d-5f11-893d-d78832ec37a9', 'BANOT', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENECHARO (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('279d4be7-fa10-5275-9aa4-f004b7b041cb', 'BENECHARO', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENTAGUAIRE (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b8b8abf4-abcd-5d8d-b11b-92d896ee7d35', 'BENTAGUAIRE', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BEÑESMEN (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f352c1c3-b3f5-5a2c-bd83-98535c853fc9', 'BEÑESMEN', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CANO (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c5e7ff64-f14b-53e9-b19a-d33b66762a99', 'CANO', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CASTRILLO (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b51cf3e4-fac0-5578-a174-1d926f6a06b6', 'CASTRILLO', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CONCEPCION ARENAL (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a1ec01f7-c720-5ecf-b667-b01437416ef4', 'CONCEPCION ARENAL', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DORAMAS (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d73c4b84-f883-53cf-9b23-d88569d2bec7', 'DORAMAS', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EINSTEIN (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('beab8b9f-0b7c-554e-9087-177357aa7295', 'EINSTEIN', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GRAN CAPITAN (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f2b678eb-eeec-585d-8d48-94b8c70b2e18', 'GRAN CAPITAN', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUATATIBOA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('92fc29b0-9e61-5da2-bd6f-9ae12e93a938', 'GUATATIBOA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JOAQUIN BLUME (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('78cc279f-b6a5-548b-82b5-65560097d650', 'JOAQUIN BLUME', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JOSE ZORRILLA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('233b21b0-4826-5d71-a587-007ec5750b1e', 'JOSE ZORRILLA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LOS SABANDEÑOS (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f80388f9-4d18-5358-8153-8b1984728231', 'LOS SABANDEÑOS', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LOS TILOS (Zona: DOCTORAL ALTO, Rango: 0 - 20)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2589c49e-b193-5b3f-9c07-6b924bdd098f', 'LOS TILOS', v_city_id, v_zone_id_doctoralalto_fe3a6961, 0, 20)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MAGEC (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f2026559-871c-5a16-9d83-8e4b1499ef99', 'MAGEC', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MOZART (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f9aca5a3-82c6-596d-9883-37f518aec177', 'MOZART', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MULEY (Zona: DOCTORAL ALTO, Rango: 0 - 99)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0405727b-b7e2-5005-aadd-b48fa781a07f', 'MULEY', v_city_id, v_zone_id_doctoralalto_fe3a6961, 0, 99)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: OBISPO CODINA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c61950b3-927e-5d30-80cb-12c08a68bb49', 'OBISPO CODINA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PAREDILLAS (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2cc56d57-1123-5f40-944b-6169c89e0daf', 'PAREDILLAS', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RIOS (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('00976635-d623-53d7-b914-aa462979f86c', 'RIOS', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SIBERIO (Zona: DOCTORAL ALTO, Rango: 0 - 99)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bb20a6ab-f74d-5ebd-9cd9-c43214c49da1', 'SIBERIO', v_city_id, v_zone_id_doctoralalto_fe3a6961, 0, 99)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TACORONTE (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1fa3f7e3-b687-5e19-8bcb-5ef11d870526', 'TACORONTE', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAHICHE (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f77e0d1e-6e16-5cb6-9aa3-984fdf6d4c58', 'TAHICHE', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TALIARTE (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9b504190-59cc-509a-9d24-9f99def71128', 'TALIARTE', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEJINA (Zona: DOCTORAL ALTO, Rango: 0 - 23)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('25662f15-6462-5523-aefb-f0dde06043c2', 'TEJINA', v_city_id, v_zone_id_doctoralalto_fe3a6961, 0, 23)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TESEGUITE (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('01ff924d-f143-518d-a81d-d5bb7e0aea7a', 'TESEGUITE', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TIJARAFE (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1a8cc632-bc26-5732-8f99-1bb69d2c82b7', 'TIJARAFE', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TINAJO (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('be943715-47f4-5369-9f8e-e160103aed2a', 'TINAJO', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TOMAS MORALES (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f3adea38-4200-529e-bf21-ca9ffaf503e5', 'TOMAS MORALES', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VICTORIA (Zona: DOCTORAL ALTO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('152c71b2-9c2f-5a09-9449-2b4d6d36c7d2', 'VICTORIA', v_city_id, v_zone_id_doctoralalto_fe3a6961, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VIJIGUA (Zona: DOCTORAL ALTO, Rango: 0 - 100)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c6580c47-737f-5b0f-89cd-ed588be3f658', 'VIJIGUA', v_city_id, v_zone_id_doctoralalto_fe3a6961, 0, 100)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AGAETE (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4655256c-ac5a-53ab-8c9a-8da4cb327c63', 'AGAETE', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AGALDAD (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5bdee5e8-cdd9-50e9-a6fa-5919ddc75e97', 'AGALDAD', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALFONSO EL SABIO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('67b66fcd-4df6-5df4-9f1a-1fbc274e52e7', 'ALFONSO EL SABIO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALFONSO SABIO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9dde2523-b575-59f2-bf28-d82e141b8141', 'ALFONSO SABIO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: APARCERIA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('616f8c27-fd5d-5c0b-83c0-1a67d5f1f518', 'APARCERIA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA APARCERIA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bc93bb5d-7a3d-545e-8c8e-afbaef67e866', 'LA APARCERIA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ARTEMI SEMIDAN (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('de038c49-aecd-56ed-85e9-d01c5b84ff47', 'ARTEMI SEMIDAN', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DEL ATLANTICO (Zona: DOCTORAL BAJO, Rango: 1 - 319)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4704a024-47ee-55b6-894c-e96670e3db7f', 'AVENIDA DEL ATLANTICO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 1, 319)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BIENVENIDO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('70aab1ef-be13-50a2-8c42-e472fac9f39d', 'BIENVENIDO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CASA CUARTEL GUARDIA CIVIL (Zona: DOCTORAL BAJO, Rango: 0 - 21)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e76804cb-1b38-5c62-953d-840bb07f0ee5', 'CASA CUARTEL GUARDIA CIVIL', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 0, 21)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CENTRO DE SALUD EL DOCTORAL (Zona: DOCTORAL BAJO, Rango: 0 - 3)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b1979139-b389-53d7-b7fa-003509c54c1d', 'CENTRO DE SALUD EL DOCTORAL', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 0, 3)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CHE GUEVARA (Zona: DOCTORAL BAJO, Rango: 1 - 120)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f8bb9769-5db4-5e17-8ff8-5b22497addfe', 'CHE GUEVARA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 1, 120)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CIRILO MORENO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('67bd89db-a59f-56e9-afa3-9251b6a9b8ed', 'CIRILO MORENO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CUCAÑA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5bebd5db-ab8c-5ca3-9d4e-574617346cd2', 'CUCAÑA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CUCAÑAÑA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('33128215-3401-5f9f-bc27-ccb04342b07e', 'CUCAÑAÑA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DIEGO DE ALCALA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2dbf2710-3287-5fc7-85df-37e7f9cf85be', 'DIEGO DE ALCALA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DOMINGO CRUZ (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('af73bbfb-d4c5-5fbe-a849-19850e016d4b', 'DOMINGO CRUZ', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DR CHILL (Zona: DOCTORAL BAJO, Rango: 0 - 99)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('01c8d9fb-1306-50b1-b405-b0864e338694', 'DR CHILL', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 0, 99)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL BREZO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9a95a2ea-1483-5e92-a824-d8dc50f5bc75', 'EL BREZO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUAYADEQUE (Zona: DOCTORAL BAJO, Rango: 1 - 121)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('339a7beb-27c2-5d9c-9cf8-2948f52fa13a', 'GUAYADEQUE', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 1, 121)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUAYRE (Zona: DOCTORAL BAJO, Rango: 0 - 99)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c0708fe4-9258-5e1a-8351-abc45a085e93', 'GUAYRE', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 0, 99)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ISAAC PERAL (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('aa2d082d-1903-5833-92f6-cd215c8abe07', 'ISAAC PERAL', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JIMENEZ DIAZ (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('45889ba4-eeb6-51ea-a117-2a75d247199c', 'JIMENEZ DIAZ', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JOVELLANOS (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('222e42d9-f2e4-515b-8c0c-4f2214d63df8', 'JOVELLANOS', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA PAZ (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e9c550c4-ef8e-5a4a-bc11-e85b65e86a84', 'LA PAZ', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MAESTRO VALLE (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f93c3297-f87f-51c4-8f9b-17be9c024290', 'MAESTRO VALLE', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MALDONADO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f4ba842f-5c80-5508-a3b9-b0d6f062ced1', 'MALDONADO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MAXORATA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1efb8ced-b3e1-560b-871f-bc70bf868c75', 'MAXORATA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MIRAMAR (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('13f7d72a-32ba-59da-a3f2-ebe752b19ce4', 'MIRAMAR', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MORALITO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b8574a02-5bb1-5bd6-bf71-ec03e548f460', 'MORALITO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARROCO ARTILES (Zona: DOCTORAL BAJO, Rango: 0 - 99)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('336a1fae-95cd-5a4b-90ff-275980469c2f', 'PARROCO ARTILES', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 0, 99)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ROQUE NUBLO (Zona: DOCTORAL BAJO, Rango: 0 - 26)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b8aad41c-d880-54e0-b99a-eb82ec976a70', 'ROQUE NUBLO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 0, 26)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SABINA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('649d994b-9260-54b5-9758-2fb0b1655780', 'SABINA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAGASTA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('13d7472f-bf76-53df-94e8-b2d22a2b0a16', 'SAGASTA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SEGUNDINO SANTANA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e332c672-7e9a-564d-8f0a-641b07f8471a', 'SEGUNDINO SANTANA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TABURIENTE (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('be983794-2446-5c1a-957d-cb095b890888', 'TABURIENTE', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAIFA (Zona: DOCTORAL BAJO, Rango: 0 - 99)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('30595a54-d837-5be9-98e5-f2f7f5c17532', 'TAIFA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, 0, 99)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEGUESTE (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f8b6de72-7e31-5b06-b2b1-6191fa6096b1', 'TEGUESTE', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TELDE (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b3687ef7-a956-5e0a-b2bf-848c3b8d2f0a', 'TELDE', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TENO (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b93d7c6e-d89a-5d46-b643-f397075b620d', 'TENO', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEXEDA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a6eb1028-ef67-5a36-af4a-421affc09735', 'TEXEDA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TISCAMANITA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('38c7af3b-06f4-5803-96a9-b8b2712fda63', 'TISCAMANITA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TISCAMANITAS (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7522314e-5e5d-53d4-a151-835356f8bc89', 'TISCAMANITAS', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TRISTANA (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3d4928ba-a85b-517d-9499-89e726f5f88b', 'TRISTANA', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VELAZQUEZ (Zona: DOCTORAL BAJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0d398a9b-f4c0-528a-ba91-ee398acfaa28', 'VELAZQUEZ', v_city_id, v_zone_id_doctoralbajo_57e6a3a6, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL PUENTE (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3fec9784-8889-596f-befa-3c8293e98cb3', 'EL PUENTE', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GRAVINA (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('24f4a2d0-98b5-5e4b-82e7-fee3b9a12ac3', 'GRAVINA', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HERMANOS RIVERO (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f2018bd2-744e-5fd8-8cc2-816acc7600cc', 'HERMANOS RIVERO', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN REJON (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5232fd29-99de-5ad3-9510-15225de607ac', 'JUAN REJON', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PEREZ GALDOS (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ac788a67-e4d2-52fa-8aed-5abef68c8133', 'PEREZ GALDOS', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN CARLOS (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7d97ded7-0d22-57be-8014-6fec03746ad4', 'SAN CARLOS', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN FELIPE (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7a01d135-c8ca-559f-8520-bf5c62361b0c', 'SAN FELIPE', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SANTO DOMINGO (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1f9608c4-aa44-54ba-945d-c4a179111928', 'SANTO DOMINGO', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEIDE (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('29d8faa9-dbc1-500f-bae2-c842fe6530ca', 'TEIDE', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEJINA (Zona: DOCTORAL VIEJO, Rango: 25 - 45)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2b6577db-fa78-5725-ada9-989430ad7362', 'TEJINA', v_city_id, v_zone_id_doctoralviejo_e3590551, 25, 45)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TENESOR (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8be6898a-b2ec-583d-9b98-06ca69b76fb6', 'TENESOR', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TENGUIA (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2b5a9ec3-7c98-5c2e-874f-b00c22121d06', 'TENGUIA', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA TIRAJANA (Zona: DOCTORAL VIEJO, Rango: 1 - 7)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('80051838-7691-5d1a-8dbc-ee3422e92660', 'AVENIDA TIRAJANA', v_city_id, v_zone_id_doctoralviejo_e3590551, 1, 7)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TRAFALGAR (Zona: DOCTORAL VIEJO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('06412ea8-6bdc-5664-9171-96c140d76031', 'TRAFALGAR', v_city_id, v_zone_id_doctoralviejo_e3590551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ABREPUÑO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('94324807-e095-5f03-965a-4deec7b6bb35', 'ABREPUÑO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AGUSTIN MILLARES (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('701319b5-1a8f-5075-b67d-4bcf9791803b', 'AGUSTIN MILLARES', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AHULAGA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e4e6156f-4423-53c4-850b-98ea751e783e', 'AHULAGA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALMAGRO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a071effe-7254-5598-b3a6-55400ed99062', 'ALMAGRO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALMERIA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('17f72a20-cd31-5a2f-96c9-e47f115001b6', 'ALMERIA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AMERICO VESPUCIO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('479d861e-b603-5c5a-867d-eab101d2b7ce', 'AMERICO VESPUCIO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DE CANARIAS (Zona: EL CANARIO, Rango: 121 - 210)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a0f21cf7-9374-54a1-b7df-a32b472dbf1b', 'AVENIDA DE CANARIAS', v_city_id, v_zone_id_elcanario_35740b41, 121, 210)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DEL ATLANTICO (Zona: EL CANARIO, Rango: 320 - 800)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2c6110ca-9ae0-5366-a4a6-19794c90b877', 'AVENIDA DEL ATLANTICO', v_city_id, v_zone_id_elcanario_35740b41, 320, 800)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVILA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('311fb0c2-ba6b-597b-aee6-393b73579ef4', 'AVILA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BALANGO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('81095606-98e5-5577-b864-084e83285e3e', 'BALANGO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BORRAJA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2577388a-a7b1-5434-87ea-15e90e8a3fe3', 'BORRAJA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CADIZ (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7c3a7e27-f5f7-5fd1-a18c-cce9006bd3f7', 'CADIZ', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CANALEJAS (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('04a96f5c-2228-5eeb-8451-8635c682f421', 'CANALEJAS', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CARLINA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9de0f6ef-0550-5a94-a716-42d99d329767', 'CARLINA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CHANO VENERO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8703c571-fd2f-54d7-8a4e-c03af5d22ae9', 'CHANO VENERO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CHOPIN (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9ebb2a3b-dd59-58bf-b16e-0267026c0d67', 'CHOPIN', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CORDOBA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2e45600c-ea74-56ce-a2c2-d693835c95d3', 'CORDOBA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL CORREDERA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e8d4ce3f-70fe-529c-acb9-d11f18a604ed', 'EL CORREDERA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EUSEBIO NAVARRO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d4dc0da9-7565-5df5-80be-c04cf009a06c', 'EUSEBIO NAVARRO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FRANCISCO DE TORQUEMADA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('39833c81-79b2-5a69-8982-7210a50cea4a', 'FRANCISCO DE TORQUEMADA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FRANCISCO PIZARRO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('793dca7f-fcfe-5401-8e93-f770feb86a2d', 'FRANCISCO PIZARRO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GRAMA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('98242712-02f7-5747-b5fe-6af108da460f', 'GRAMA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HINOJO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('58dab368-df80-54bc-b4e6-8203b8849165', 'HINOJO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ISLAS MALVINAS (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2073cea8-4866-5ec2-bcfa-7699afb5b8b3', 'ISLAS MALVINAS', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JOSE ZERPA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ca6b2f73-f190-5230-8013-698ae9fbb4a1', 'JOSE ZERPA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN SEBASTIAN ELCANO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('506e98d0-3aec-5ccf-a4ce-277b39ce2ca6', 'JUAN SEBASTIAN ELCANO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LUIS DE GONGORA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6999799d-5a76-5845-aac1-4d116e5519c6', 'LUIS DE GONGORA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MARCONI (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e02cad0f-9cf9-59b2-bb5a-66bde967638f', 'MARCONI', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MARIANELA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('73f71dd3-4e3a-53c3-92a8-ded9b54853b4', 'MARIANELA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MARRUBIO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ddcde49e-1142-5395-9e70-1cad96748fc4', 'MARRUBIO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MESA Y LOPEZ (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7370cee0-1712-58e0-b87d-1c1932f13f48', 'MESA Y LOPEZ', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MURCIA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ec993cd4-0d90-51ed-aa74-ea19f82f0afb', 'MURCIA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NORSA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('94932f21-8d1b-506c-a70f-0a790a7ce1dd', 'NORSA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NUÑEZ DE BALBOA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('275543b1-30af-5ce1-b681-01c0cdc95470', 'NUÑEZ DE BALBOA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ORTIGON (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b3403644-b87e-575d-93ac-a8131f6f1b1b', 'ORTIGON', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PALAFOX (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8a881096-04d4-56af-914c-691609d97a9c', 'PALAFOX', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PALMERA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cb295e2a-6833-5ed7-bf51-7f56ed5d5da0', 'PALMERA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PAMPINA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7de2c516-40e5-5b64-9362-7bb7ab2637a4', 'PAMPINA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARQUE EL CANARIO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b4d0fc77-4f17-58cc-bbad-19c2984d5048', 'PARQUE EL CANARIO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PAZOTE (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('68af882d-60e0-563e-a243-e2be6d846304', 'PAZOTE', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SEGOVIA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('450c742e-c2dc-509f-8fbe-52b321548f52', 'SEGOVIA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SIEMPREVIVA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6d9dd388-d81d-57bb-bfbc-f9f509a79d80', 'SIEMPREVIVA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SILVESTRE BELLO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3f750c5e-9c61-5d08-b026-dbdfaf7d12ac', 'SILVESTRE BELLO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SORIA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5a893c4e-0177-5f94-b959-829af76d5eb4', 'SORIA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TITANA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ba9d553b-aa89-531b-bf92-e6aaaca6de94', 'TITANA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TREBOLINA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6c8151c6-627e-5e59-a454-ed04a21c9d34', 'TREBOLINA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VICTOR HUGO (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3a01852d-30af-5ab8-a7c6-baef7e95bafc', 'VICTOR HUGO', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ZAMORA (Zona: EL CANARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b09ec653-d693-5a7f-b1d0-f2c4416c3e1b', 'ZAMORA', v_city_id, v_zone_id_elcanario_35740b41, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FRANCISCO GOURIE (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e5aaf7ef-9006-5ff4-b02b-82146ff28b9b', 'FRANCISCO GOURIE', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARCIA MARQUEZ (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a7f9ef46-f1fa-5238-b944-b520d949f948', 'GARCIA MARQUEZ', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GOMERA (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3a3b3b39-dde3-52da-a00f-104b91a07db4', 'GOMERA', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HIERRO (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d25a42cd-589e-509c-a5c9-a74ec0c29457', 'HIERRO', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN DE BETHENCOURT (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bb56bc0e-fd8a-53ba-b010-398bed3a8ff7', 'JUAN DE BETHENCOURT', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LENTISCAL (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8bd30ad3-be79-5409-ba71-e8178ca4fb1b', 'LENTISCAL', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TIAGUA (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a1afe030-af8b-5ba6-91b2-7a38f67295bc', 'TIAGUA', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VESALIO (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c5fc27a9-c290-50e0-bea4-152d3e6e704e', 'VESALIO', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VIÑATIGO (Zona: EL CRUCE, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('75895bd3-88cd-5832-9ec6-bf641c4287dc', 'VIÑATIGO', v_city_id, v_zone_id_elcruce_a875d265, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BAILEN (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('94115371-f0d1-562c-a3e9-b2c7c52df8f3', 'BAILEN', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL SIRINOQUE (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c053b850-a199-520e-8d1c-c8d3a91c70c7', 'EL SIRINOQUE', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL SORONDONGO (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('32ef88fe-f3f3-5ef1-8911-10a22e8bc9ef', 'EL SORONDONGO', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL TANGANILLO (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3c5669d0-9957-5420-9b69-454fbf5235a6', 'EL TANGANILLO', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL TIMPLE (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d52ec32d-7971-5f26-ad38-df0c0e3f41a6', 'EL TIMPLE', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FORTALEZA (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c8aab2ce-03b2-5e88-be04-1674c11f0607', 'FORTALEZA', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HIOCRATES (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2aac6299-5c6b-5428-87ed-fa3148e08efe', 'HIOCRATES', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HIPOCRATES (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('23a96652-1a8e-51d5-97c9-b671ac4a4dc2', 'HIPOCRATES', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA BERLINA (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3219e798-7569-5d85-82cf-312552e1f16a', 'LA BERLINA', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA MALAGUEÑA (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('dabd0ff8-4366-5bb9-ae59-5d6614f9c2e4', 'LA MALAGUEÑA', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA PALMA (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d4b4a4cc-0692-50ee-a053-c766ec15aeb9', 'LA PALMA', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LAS ANGUSTIAS (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5c734299-87a8-5f70-865c-b9a93c2d5f8e', 'LAS ANGUSTIAS', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LAS CHACARAS (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('12923f1c-257d-5cb5-a60e-6ab25a5c9e4e', 'LAS CHACARAS', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LEON Y CASTILLO (Zona: LA BLANCA, Rango: 94 - 247)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d7c305c6-435e-50ae-8b6e-71aa75b1260b', 'LEON Y CASTILLO', v_city_id, v_zone_id_lablanca_18267716, 94, 247)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MEDICO JUAN SANCHEZ RODRIGUEZ (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('dc24c60c-6b1c-5cd9-8eec-aeafd9e69b7d', 'MEDICO JUAN SANCHEZ RODRIGUEZ', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: OBISPO VELA (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0de61cf0-aa6f-5849-9d88-c1b208262674', 'OBISPO VELA', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PAJONALES (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('94aad544-a452-539a-8626-aa0396b4ba9b', 'PAJONALES', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PANCHO GUERRA (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('95c9d8d7-2bb4-52c5-9c46-1f3fd12e5a83', 'PANCHO GUERRA', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAJASTE (Zona: LA BLANCA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f7a39b6c-0129-5c13-bf00-88987e9ba107', 'TAJASTE', v_city_id, v_zone_id_lablanca_18267716, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALMOGAREN (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5ccfb650-dccc-57ed-95af-41f5510e0092', 'ALMOGAREN', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALONSO QUESADA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('653ebf4a-5b75-5c65-a938-1e3c3fb28a83', 'ALONSO QUESADA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AYACUCHOS (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('de96e6cf-b492-5974-88e5-1fd36b243b53', 'AYACUCHOS', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BALILLO (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('05b29809-dfeb-5b8a-9852-ef6cbd3bd53e', 'BALILLO', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BEETHOVEN (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('052b3325-65a5-5383-9fc5-2d8a9ecf47a9', 'BEETHOVEN', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BOLIVIA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b7f6cbe2-761d-5d95-b01d-97ef961e5710', 'BOLIVIA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BRASIL (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('803b58ef-4a65-545d-87be-d98fe48e9dcc', 'BRASIL', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CHIMBESQUE (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('71d5e4bb-f93d-59fd-b529-831f9994c2cb', 'CHIMBESQUE', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: COLOMBIA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b46bc5db-7420-513a-84c7-1d2f1b2561a3', 'COLOMBIA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DIEGO DE ORDAZ (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('fd612c05-65df-5da4-9b71-18bb62a38010', 'DIEGO DE ORDAZ', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DR RAFAEL GONZALEZ (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d89ecde1-fbb6-58d3-b663-8e484abc9bf9', 'DR RAFAEL GONZALEZ', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ECUADOR (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b860f6ff-1162-53a6-ba74-24c1bd6e3d00', 'ECUADOR', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL JABLE (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8968af86-e990-5add-8370-a8abf261ca20', 'EL JABLE', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL SALVADOR (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('89aa084e-c48b-5bf9-aa97-3e7cf93e7fdc', 'EL SALVADOR', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FAYA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6147297e-a42d-5357-9e92-05da36f1bbae', 'FAYA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GAROE (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5a4f54ee-d1dd-57f9-8850-b8261cecb90d', 'GAROE', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GRACILIANO ALONSO (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7e0d687b-c272-5931-a78d-dc489bb779a2', 'GRACILIANO ALONSO', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUATEMALA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c7851821-2047-51d3-8e02-7773afb2db6e', 'GUATEMALA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HONDURAS (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7e5f57da-edff-58b8-9136-dfb75b58bd34', 'HONDURAS', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: IFARA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('eb3c2086-143c-579a-9ce4-40d7bbb2d83c', 'IFARA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: INGENIERO DORESTE (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('244ba20a-f422-5e4f-92aa-656da8f222ba', 'INGENIERO DORESTE', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JAIME BALMES (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bb620e8c-2b7b-5125-ba87-266a54a64a7b', 'JAIME BALMES', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JANUBIO (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7082081c-9762-555c-b1c7-4e28adb6f1d6', 'JANUBIO', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA CENTRIFUGA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('30869f61-841f-5e85-b7d4-33f9db2f5202', 'LA CENTRIFUGA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LOS GUANILES (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('440dbe2d-6048-5763-9f1c-c288154afdfa', 'LOS GUANILES', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LOS LLANOS (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('faabcbe8-44e1-5888-a074-6de4b5a8aa5d', 'LOS LLANOS', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MASCA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('85f0511a-949c-5d66-9573-bf3d0d92234c', 'MASCA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MIGUEL ANGEL (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7019acb4-6cf7-58a5-b332-ceb5a7eb1485', 'MIGUEL ANGEL', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: OROVAL (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1afaa0b4-e049-5e6e-a3ec-28e2e4affd3a', 'OROVAL', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARAGUAY (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9577e75a-97ee-5c9d-a70b-0daa56199b7a', 'PARAGUAY', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PERU (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('57a15b9b-3e1b-5556-9a9f-ba212b524963', 'PERU', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ROQUE AGUAYRO (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0d3edbec-80e8-5df9-b345-d37876ce12d5', 'ROQUE AGUAYRO', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SALVADOR CUYAS (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('921251ee-1848-52b5-a32e-cf8e484727fa', 'SALVADOR CUYAS', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAGANANA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1d03c66b-eb7f-5158-bddb-58647a6a7ab4', 'TAGANANA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAJARASTE (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e8b2ec66-2c2c-53e7-8108-72416079bdcf', 'TAJARASTE', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAMADABA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4f3bd685-2357-59f4-8a48-b0ec88f387a1', 'TAMADABA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAMASITE (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cbed5286-90f9-5888-9e46-1a29b8cdb1a5', 'TAMASITE', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEFIA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a161ee00-1cc3-53f6-9916-270ce46e2cef', 'TEFIA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VENEZUELA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1d66e3b6-c95e-5861-9985-2dd056f6e651', 'VENEZUELA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VERODE (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('471a70fd-2dca-573d-bc12-e5478f1dcdff', 'VERODE', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: YAIZA (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6cb31213-fa3a-53e6-8ddc-96763181c447', 'YAIZA', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ZONZAMAS (Zona: LOS LLANOS, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('360e31dd-e0db-5b85-b40a-fcee6667872e', 'ZONZAMAS', v_city_id, v_zone_id_losllanos_1c6c4533, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AMAGANTE (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('496a486f-836b-5c46-8620-c387d58cb93b', 'AMAGANTE', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ARGENTINA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('991574b8-7b21-54e6-8157-163ac6e3216b', 'ARGENTINA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BARTOLOME CAIRASCO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b928d7bf-704c-5822-9ab8-c079a40ca9db', 'BARTOLOME CAIRASCO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BECQUER (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8048e3c8-d4fb-507a-ab47-cffe9f281a0c', 'BECQUER', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CAMINO LA MADERA (Zona: ORILLA BAJA, Rango: 55 - 280)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2f70bcfc-9b1c-586e-a0cc-e4151e66e4e1', 'CAMINO LA MADERA', v_city_id, v_zone_id_orillabaja_593aed8d, 55, 280)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CIPRIANO MERA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1da6a57e-4364-5c4e-b2a3-ac30b6732710', 'CIPRIANO MERA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: COSTA RICA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e1423e7c-14fe-5b5a-9d04-5c397f006bae', 'COSTA RICA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CUBA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c3d78d9c-8ea5-5a43-8dac-ae693ed6db04', 'CUBA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DEAN RODRIGUEZ BOLAÑOS (Zona: ORILLA BAJA, Rango: 96 - 154)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c2f4c30f-f0bb-5e1a-af86-913304df71a8', 'DEAN RODRIGUEZ BOLAÑOS', v_city_id, v_zone_id_orillabaja_593aed8d, 96, 154)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DIEGO ABAD DE SANTILLANA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2152a8ac-765f-523f-96ff-5a84e2224b7e', 'DIEGO ABAD DE SANTILLANA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DOCTOR PASTEUR (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d9498d02-607d-5b64-972c-2986cfb18fa8', 'DOCTOR PASTEUR', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EMILIO CASTELAR (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2fd888cb-85e5-56cd-a111-d67960711d6a', 'EMILIO CASTELAR', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FRANCHY Y ROCA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('603514ba-2548-5042-a44d-5067ba6087d4', 'FRANCHY Y ROCA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FUERTEVENTURA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4fa1803d-6a14-5291-abc3-80870ec5ebdc', 'FUERTEVENTURA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARAFIA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('617a99ff-ba2b-5a9b-bed8-08dc1e26ff42', 'GARAFIA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARFIA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('858ef7c4-94f4-5ede-9345-633c7693f938', 'GARFIA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUAYDIL (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6ac1169a-de72-58cc-b23d-6e64f7e23b06', 'GUAYDIL', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HAITI (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ff1378e8-ddd9-56af-928f-16ce9cd9f9bf', 'HAITI', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ISLA DE LOBOS (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cee9ec8f-a33b-594c-978c-cc0c33440cf3', 'ISLA DE LOBOS', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JAMAICA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e4c66f95-2d55-56e4-b80d-4fd4bc7e736f', 'JAMAICA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA GERIA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f1a77ecc-de2d-51f4-b460-6e273b42b241', 'LA GERIA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LUCHANA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b092b768-2163-58a0-9799-18a2f8479e39', 'LUCHANA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LUJAN PEREZ (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f9dacb9e-61f0-5a13-aaf8-7778fde74922', 'LUJAN PEREZ', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MADRE TERESA DE CALCUTA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('96150f67-997d-5701-8dc9-7427e100820e', 'MADRE TERESA DE CALCUTA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MARTINEZ DE ESCOBAR (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3b517264-43d6-56b4-b7c5-6a183a237ff5', 'MARTINEZ DE ESCOBAR', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MOLINO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('69e40389-a727-558b-9086-89f191822b7c', 'MOLINO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NICARAGUA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('36a619db-6399-5d59-b834-1042d2ae9372', 'NICARAGUA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: OBISPO CERVERA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('02b2f025-0692-5383-bd9c-9cb9e490a0c7', 'OBISPO CERVERA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ORILLA BAJA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('92db4a01-1ec8-50e0-aeb3-30d02f566a61', 'ORILLA BAJA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PANAMA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c0cf2ed7-3728-5392-a943-abfbfa341668', 'PANAMA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PIO BAROJA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('efc9cd6e-c02a-5e0f-bd25-41696166d632', 'PIO BAROJA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PUERTO RICO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('96526b08-e6ea-5985-8260-2d70554f3b38', 'PUERTO RICO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAGUNTO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d9ad4a5f-da31-5100-9da1-849533ccfe27', 'SAGUNTO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN ANTONIO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c2d77a69-840b-535d-96d1-0f95a4248d67', 'SAN ANTONIO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN COSME (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0c94926d-4f0f-5a25-9f27-f06ba4a32c21', 'SAN COSME', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN DAMIAN (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('715ee065-d2a5-5b24-bd30-081d43dd727c', 'SAN DAMIAN', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN MARCIAL (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('48c3ead2-9522-5753-b0a3-6745c47adb8f', 'SAN MARCIAL', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN MARCOS (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d0f666c9-f6b5-5b19-afc1-1799b53d6a6a', 'SAN MARCOS', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN SERVANDO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('47f03b51-9eea-5379-b797-815cbf66aad3', 'SAN SERVANDO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN TELMO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('96345c15-e6a5-56b7-a82c-fc50667fc2cd', 'SAN TELMO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TINTORETTO (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('88eb184d-e187-5e2f-9573-0d4257eadd8a', 'TINTORETTO', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: URUGUAY (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('800a2c96-d106-5f08-bbd4-5c395edc1ccf', 'URUGUAY', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VACAGUARE (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8a874a62-320b-5270-8355-74463d6a2453', 'VACAGUARE', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VALLE INCLAN (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('254eaba5-b27f-5406-ba9b-c503c04388fd', 'VALLE INCLAN', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VASCO DE GAMA (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('fe15b1cb-f872-518a-aab3-b77a0a72242e', 'VASCO DE GAMA', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VENTURA RAMIREZ (Zona: ORILLA BAJA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('41c50b50-1b14-52cc-8975-bf5729881278', 'VENTURA RAMIREZ', v_city_id, v_zone_id_orillabaja_593aed8d, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BAJA EL MOLINO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('701764ea-1428-57e9-b1e3-c3712277810a', 'BAJA EL MOLINO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BARRANQUILLO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a377f2f1-3937-5a36-b4bf-307c9b9d437c', 'BARRANQUILLO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BEJEQUE (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('180079ad-34c8-510a-adb8-0dc5970d0adb', 'BEJEQUE', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENCOMIA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1b04b975-017e-5627-953a-b9b2e3e9969b', 'BENCOMIA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CAMURRIA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e0936254-e541-5f08-9e49-5a62dea22084', 'CAMURRIA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CODESO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bc393908-0d67-5b07-b53c-3ddf822b7337', 'CODESO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CUEVAS DEL BARRAQUILLO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ef24ec81-4752-5bea-b730-d9f5d35ad71a', 'CUEVAS DEL BARRAQUILLO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL ANZUELO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('78b63f9f-06e7-5df3-8341-37a204b6db5a', 'EL ANZUELO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL ARENAL (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('eebdfa5d-8444-5949-a03e-f1adbbcbac1b', 'EL ARENAL', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL CABOSO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('38918e20-b757-52b8-9c96-bcfaf1527762', 'EL CABOSO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL CABRACHO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f7d33caa-def6-5fc8-9607-d91c082583bf', 'EL CABRACHO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL CEDRO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4f0a025b-05e6-599b-8759-16998b950b99', 'EL CEDRO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL MERO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e0def226-c4aa-57f1-bff6-a57eb719a593', 'EL MERO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL RIBANZO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('62de2d96-1720-5325-a9f4-b4b8cbe021ca', 'EL RIBANZO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL SARGO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d238b9fe-8521-5f28-abbe-c135fd906fc9', 'EL SARGO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ESPINERO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d90f477b-5323-5531-91ad-d05f31248697', 'ESPINERO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GAVIOTAS (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0e64ed3b-60b5-55e6-8f56-bfc79ab24483', 'GAVIOTAS', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JARA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a5258202-473b-5a6a-aba1-82db2111db83', 'JARA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA BOGA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a7a710ad-f073-55d7-975b-686bef9e251b', 'LA BOGA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA CHOPA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5f5ab79e-dc38-5bc3-969c-88a756534760', 'LA CHOPA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA LAPA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ee4f9458-2ebf-5132-9f3a-b6241821fe4f', 'LA LAPA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA SALEMA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('be9bba6d-019a-5366-95bf-a5e0f4430ff1', 'LA SALEMA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA SEIFIA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('65acfd5d-976f-5419-a36f-3140fb5923f4', 'LA SEIFIA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LAS BAJAS (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('72352058-59c9-5576-8874-fd3fd673faaf', 'LAS BAJAS', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PIEDRAS CHICAS (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('526f2738-a69d-5075-b3d5-dc4e5defca83', 'PIEDRAS CHICAS', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PIEDRAS GRANDES (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1b9b4a04-50fa-5c20-8f4f-e95ed7ab618a', 'PIEDRAS GRANDES', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PIEDRAS NEGRAS (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8b19b3a4-c9fd-51b6-9da6-a83d2bb05281', 'PIEDRAS NEGRAS', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PUNTA TENEFE (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cb59d3d6-59a6-5a6a-a047-d591ebedd546', 'PUNTA TENEFE', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RETAMA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f4c697d6-e53e-5d2c-b8cd-9b1b34ba7ba4', 'RETAMA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RUDA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('58b5d766-f7ef-5e3c-8d99-3a6a0fb609e6', 'RUDA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SALVIA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5cd744c5-8d50-5879-9b12-8800829d6cbe', 'SALVIA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAJORA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2f27fb0a-4773-5cef-ab99-07cac5c45370', 'TAJORA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAMOZEN (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('145d3f37-568e-5989-b62b-d2f757e8019a', 'TAMOZEN', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TANQUE REDONDO (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f46c00b7-be15-5386-847e-cdf78c72d212', 'TANQUE REDONDO', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEDERA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e970cc80-6b78-5349-87b7-ae8e3dc3ba83', 'TEDERA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TIGOTAN (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3fa1b0d4-6cef-51d0-b766-9c04ec0a5c22', 'TIGOTAN', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VINAGRERA (Zona: POZO IZQUIERDO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f8d43e9e-91ec-560c-a3e9-0e7dcfd684b2', 'VINAGRERA', v_city_id, v_zone_id_pozoizquierdo_32493452, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AGUATAONA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f5b35a21-8b10-5434-8b1d-43e163595e55', 'AGUATAONA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALBERCON (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cfab1b3e-6fae-50ed-81a2-891d0080f74a', 'ALBERCON', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANDEN VERDE (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5928a386-faac-5f5c-87e6-2d90ba899190', 'ANDEN VERDE', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANTONIO BOLAÑOS (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9634ebd9-0363-58b3-89de-2cbe9957d01c', 'ANTONIO BOLAÑOS', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ARAPILES (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4a150011-9c7b-5b46-b5fc-56108b9d4b1d', 'ARAPILES', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENCOMO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f8cf390a-4a07-5cb9-96f1-c22b93d95cf5', 'BENCOMO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BRAVO MURILLO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c00c3e94-eaa0-5bc5-84d8-d4e440c7eac4', 'BRAVO MURILLO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALDERON DE LA BARCA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('66b5af59-870b-5dbd-9e3a-906f16d0943f', 'CALDERON DE LA BARCA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CARMELO CALDERIN (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d64275a9-b246-5303-ad77-6056f3276897', 'CARMELO CALDERIN', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CERVANTES (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3ef9ac4b-281b-55d0-a3be-0ee63329a268', 'CERVANTES', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: COVADONGA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c0201776-532b-554b-a4c6-e084b5d96179', 'COVADONGA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DEAN RODRIGUEZ BOLAÑOS (Zona: SARDINA, Rango: 1 - 95)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ba9bc371-85c1-552c-a883-250539ed7ada', 'DEAN RODRIGUEZ BOLAÑOS', v_city_id, v_zone_id_sardina_1e0d0551, 1, 95)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DRAGO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f36317a7-0585-5e18-a93b-88d38d17ddc0', 'DRAGO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL ALGARROBERO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('880cb4e1-36b2-588f-b63b-d61b382be5e0', 'EL ALGARROBERO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL CARDON (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0bca27a2-5df2-5508-825c-ef18743aaab0', 'EL CARDON', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: EL CID (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('15d0fda3-b095-5606-ac4f-a58c2f7e6e2a', 'EL CID', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARAJONAY (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1006485a-5f75-5af3-95af-7c301854af57', 'GARAJONAY', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GRAJO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('98f97f57-286c-5b90-b566-d914b40eb8b7', 'GRAJO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUACIMARA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2e7c0541-f646-55e8-a02e-39e555511e8f', 'GUACIMARA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUINCHO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0f66cdaf-9c4c-5170-8bb5-4568c9cca2f3', 'GUINCHO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HARIMAGUADAS (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('72e3161c-45db-5287-a815-6037a1dc082e', 'HARIMAGUADAS', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HOYA DE LA NEGRA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('136db698-3c90-5bf5-a2bf-f864cbd6357e', 'HOYA DE LA NEGRA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA ENREDADERA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c0d248cf-2029-5698-8a8d-b5d73e755cc1', 'LA ENREDADERA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA FOLIA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7f0933b8-c4d2-5359-bda2-4bd1a2502335', 'LA FOLIA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA ISA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('929677ef-cd3d-51e5-9db8-51ea9e442b28', 'LA ISA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA POLKA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('eb2a7a9a-293e-59ce-8aba-b519987ea43a', 'LA POLKA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA SALLE (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d10fea25-baeb-5eb6-ac89-715f17dc6565', 'LA SALLE', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LAS CARBONERAS (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2e3eadaa-81c0-5349-b140-981d24171927', 'LAS CARBONERAS', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LEON Y CASTILLO (Zona: SARDINA, Rango: 1 - 93)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e9bd3aa4-1194-5d20-99a5-cec08990a069', 'LEON Y CASTILLO', v_city_id, v_zone_id_sardina_1e0d0551, 1, 93)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LEPANTO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('068a6c1c-fbe2-5587-94ce-7b5910f4ed0a', 'LEPANTO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LOLITA TORRES MELIAN (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c90bb15b-d885-594c-b673-c510e2857739', 'LOLITA TORRES MELIAN', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MANINIDRA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2f1c8778-22a4-535f-8b38-a90434a32529', 'MANINIDRA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MARIQUITA MARTIRIO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b0557986-ec81-512d-b63e-48002f1df781', 'MARIQUITA MARTIRIO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MIGUEL SERVET (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ee9c1e4e-08ac-5b68-82ce-156b1d930f11', 'MIGUEL SERVET', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MOZAGA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ab6a3cae-c666-5167-a02c-6b861968c0aa', 'MOZAGA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NIVARIA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('89ca809d-686b-57f5-a9b7-680dc8e11e85', 'NIVARIA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ORILLA ALTA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('687c834f-37b4-5a82-97cf-2e7dace421a7', 'ORILLA ALTA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PADRE CLARET (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('601c85d3-8010-59c9-92cc-41d82b003b30', 'PADRE CLARET', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PADRE CUETO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bdfd3a36-977f-542b-9d86-4ff91467af27', 'PADRE CUETO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PADRE MANJON (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('21c534d6-715b-5291-bbc9-c4b5b15c131e', 'PADRE MANJON', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PASAJE 8 DE MARZO (Zona: SARDINA, Rango: 0 - 40)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('489816ac-aa26-5828-b7c3-ff76ed0cc2b3', 'PASAJE 8 DE MARZO', v_city_id, v_zone_id_sardina_1e0d0551, 0, 40)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PELAYO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4a519f2a-cb3e-5c9f-9e4b-d18813dd0f6b', 'PELAYO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PRESBITERO POLICARPO BAEZ (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6d5ea302-7e70-58d4-b331-7047c10fac39', 'PRESBITERO POLICARPO BAEZ', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PRINCESA GUAYERMINA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3bb278c3-8c46-5a1c-896f-27d98f7d92c3', 'PRINCESA GUAYERMINA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PRUDENCIO MORALES (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9468b489-1c89-5d99-b2d4-339b88291a90', 'PRUDENCIO MORALES', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ROSARITO FRANCO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1e01c0b6-c39f-57bb-9e9a-69437c28edba', 'ROSARITO FRANCO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RUTINDANA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f565a6e8-7939-55eb-aa3d-d68ad5890f42', 'RUTINDANA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN FRANCISCO JAVIER (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('69d3ca5c-80ff-50e0-a0ea-76488bdde619', 'SAN FRANCISCO JAVIER', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN ISIDRO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b90a2f12-110a-5c7b-a7a2-d715a7b03b3e', 'SAN ISIDRO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN JOSE DE CALAZANZ (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7fce6307-275a-53ca-997a-92c728cef897', 'SAN JOSE DE CALAZANZ', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SANTO DOMINGO SABIO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('08553aad-8a94-5d9d-a01c-557b548cbd04', 'SANTO DOMINGO SABIO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SANTO TOMAS DE AQUINO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6bac2ed3-b6b8-5c07-9490-80ae65df3d4e', 'SANTO TOMAS DE AQUINO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SEVERO OCHOA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f18068f1-a205-5ecc-89d2-867c5a18de60', 'SEVERO OCHOA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TABAIBAL (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2dde9339-ac87-50b7-baf8-9831d0e12d0e', 'TABAIBAL', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAURO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('634723a3-f735-5ad8-a5b5-3ede40fb77d2', 'TAURO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TECEN (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3261cf5d-e57a-5573-9cb8-e7040495ef1f', 'TECEN', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEGUISE (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('dc7f9d2d-d09a-59d3-9417-37bd00c0c4b2', 'TEGUISE', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TENESOYA (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3644fc67-3b52-5c7d-bafd-c092015a01a2', 'TENESOYA', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TINGUARO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b29f570a-c144-5066-a14c-b20d09d8e2e8', 'TINGUARO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VILLAVICENCIO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2e05f559-adfa-57ad-b87e-3f41ca353684', 'VILLAVICENCIO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VIRIATO (Zona: SARDINA, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ab0c0d8b-33ca-56dd-b686-cf945079c9e0', 'VIRIATO', v_city_id, v_zone_id_sardina_1e0d0551, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ABONA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('84e5a938-2195-5cfd-81e5-d54790f12a3a', 'ABONA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ACENTEJO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4d65ee00-bb1b-54ab-bbf4-a498bd7dcde3', 'ACENTEJO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ADARGOMA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('91aaeaf1-f41d-5841-b0da-521fb1580916', 'ADARGOMA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ADEJE (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('eb96582b-b3ab-5927-b6e6-267a4ec0f5cc', 'ADEJE', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AGUSTINA DE ARAGON (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('158bfdf2-0405-51cf-bfca-ee0ac44300ec', 'AGUSTINA DE ARAGON', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AJODAR (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c5765da0-8d14-5473-bf4c-1e1ba6ef8fa0', 'AJODAR', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALBENIZ (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e45bc60a-061c-568c-a1d6-c7ab6450ecb9', 'ALBENIZ', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AMPUYENTA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0749c5f1-41cb-57e8-bfdc-252fac29b8a5', 'AMPUYENTA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANGEL GUERRA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('03cf70dd-3e31-50fb-8a97-eb15e7779819', 'ANGEL GUERRA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANGOSTURA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d1f44b93-19bb-5b41-aa63-d5cd4de0808c', 'ANGOSTURA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ARIDANE (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9b8ff726-a8c7-551f-9e10-b5cd844b1ae5', 'ARIDANE', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ARTEMISA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c75aa1f2-e8ca-587d-b4db-2ad25cfcd4b8', 'ARTEMISA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ARTESANO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('942e52ac-0cb3-5c84-9be0-03866e751a89', 'ARTESANO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DEL ATLANTICO (Zona: VECINDARIO, Rango: 2 - 401)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3410aa89-538a-5057-aab4-4edae393d3bf', 'AVENIDA DEL ATLANTICO', v_city_id, v_zone_id_vecindario_e077887e, 2, 401)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AZUAJE (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7954552d-0d9c-5859-a5be-d869698cd059', 'AZUAJE', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENTAIGA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('13235c73-a7f0-5d09-b7d3-152a848c1854', 'BENTAIGA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENTAYGA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0986cd5f-9053-5694-9e5a-bd2ed49eda76', 'BENTAYGA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CAPITAN CORTES (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f8a36040-ad40-5e9a-bf0b-d2c52711f907', 'CAPITAN CORTES', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CERRUDA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0f98500e-9760-5751-a82d-cfeeec9e714d', 'CERRUDA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: COLON (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('baf2decb-a021-52cd-938a-796c3734f5d0', 'COLON', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DOLORES DE LA ROCHA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('08aff99e-552f-5b87-b57a-a8afa4943f1d', 'DOLORES DE LA ROCHA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DOMINGO DORESTE (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3fd05ebc-78ed-5c20-995c-ccab834e2448', 'DOMINGO DORESTE', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ESPRONCEDA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ea434c4c-ea96-5b46-a107-b08c6e5c2c35', 'ESPRONCEDA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FAGAJESTO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cad98eee-0097-5ee9-a93a-c2383b118735', 'FAGAJESTO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GAMONAL (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('31179886-d973-5049-ba5e-314638dd045c', 'GAMONAL', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARCIA TELLO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5a0cc6a1-f7d7-5b2b-9a8a-5adbc4ea339a', 'GARCIA TELLO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUADARFIA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('732ae875-c3e5-5e7b-9417-9db156822530', 'GUADARFIA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUAYEDRA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a8bfbd05-dcf5-530e-bf8e-24b4618f2fc6', 'GUAYEDRA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HERMIGUA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9703af76-757b-5b3d-b831-bab4a15f8ac0', 'HERMIGUA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HERNAN PEREZ (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('07d498c0-4d8a-585c-a469-c091f3670d32', 'HERNAN PEREZ', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: INDALECIO PRIETO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8dbe9fb8-cd92-573f-a82a-966c4f566a93', 'INDALECIO PRIETO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: INSULAR (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('49d0d510-5dcd-5918-8de2-9fe5ad3b493f', 'INSULAR', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ISLA GRACIOSA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ae9ce876-0a1e-5dba-b026-ba034008a88c', 'ISLA GRACIOSA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JANDIA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('eec47212-e892-55e6-80d3-50603ba1727f', 'JANDIA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JERONIMO FALCON (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bcecb571-7d5c-5871-9ef9-6a4ef2b5a0ed', 'JERONIMO FALCON', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN ALVARADO DE SANZ (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('54182d52-8716-53ec-9756-88d671523364', 'JUAN ALVARADO DE SANZ', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN XXIII (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('13f72997-bf1e-58c0-b3a0-cb6bed48fe10', 'JUAN XXIII', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LENTINI (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('97edf231-a16f-5b47-940e-5cacccd47b37', 'LENTINI', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PASEO ARTESANO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3955b7a1-6846-5073-81fc-4a108e74315b', 'PASEO ARTESANO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PASEO DE LA CONSTITUCION (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('685e05a2-a595-5eaa-8f34-e3543ac889b9', 'PASEO DE LA CONSTITUCION', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PEDRO DE ALGABA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2814bede-049a-5b3d-9151-d57e0f0ed406', 'PEDRO DE ALGABA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PEROJO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4ea6ac14-2d9d-5826-9d86-28fd0c5a5e42', 'PEROJO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PIO X (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6f667c31-3038-5235-a440-527832d0a592', 'PIO X', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PIO XII (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9af2c5bc-e9e0-58e5-ab52-03d706cb4ed5', 'PIO XII', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: POEMA LA MALETA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f64719d1-ac55-53d7-8283-bbb4fb2a96ee', 'POEMA LA MALETA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SALVADOR ALLENDE (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b497edd9-a0a6-58c1-8e88-50624a06c174', 'SALVADOR ALLENDE', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN FRANCISCO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1fa0de63-92fb-5084-933a-e448d7d71ef4', 'SAN FRANCISCO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN JOSE (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6d7477bf-244b-5900-90a7-d0163bac830f', 'SAN JOSE', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN RAFAEL (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e84489be-ef91-5e9a-a92f-73e4772454f0', 'SAN RAFAEL', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAORO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7f8945d6-5a1f-5da1-a494-804d736a6528', 'TAORO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TARA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('71573b79-348e-56ee-a5f7-3ee93c8aec77', 'TARA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TASARTICO (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('95fb46cd-a495-500c-96cb-4b6bb3451378', 'TASARTICO', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TUNTE (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('744a8223-e198-5600-918d-c03e06724ae7', 'TUNTE', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VALLE SECO (Zona: VECINDARIO, Rango: 0 - 100)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6b6ae5a0-8b20-5802-95da-137b1bb762fb', 'VALLE SECO', v_city_id, v_zone_id_vecindario_e077887e, 0, 100)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VENEGUERA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('40b3adc5-3c5b-5a83-bead-40b2447f93af', 'VENEGUERA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VICTOR JARA (Zona: VECINDARIO, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e53b0743-c815-5053-b856-4ba180320f9c', 'VICTOR JARA', v_city_id, v_zone_id_vecindario_e077887e, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALAJERO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1ec93c43-acdd-56c1-bebe-dc6ed10c0434', 'ALAJERO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALEJANDRO DUMAS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('67a55899-14c9-5fc9-89b6-567f4f2a9e56', 'ALEJANDRO DUMAS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANGEL GUIMERA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('38b3a2af-5117-5d59-94e4-babb64b7552f', 'ANGEL GUIMERA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA DE CANARIAS (Zona: VECINDARIO 2, Rango: 211 - 354)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('156c678d-0da2-5798-a4f2-e7358cc19ea0', 'AVENIDA DE CANARIAS', v_city_id, v_zone_id_vecindario2_9c645546, 211, 354)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENARTEMI (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('124768ae-9b0b-5102-92af-abb3548c087b', 'BENARTEMI', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENTEJUI (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a02a2f11-7996-5a32-95e6-75279250bfc4', 'BENTEJUI', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BLAS PASCAL (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4f545b6b-a43b-51ba-95c9-09de7e26821b', 'BLAS PASCAL', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CHIPUDE (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1f6ace66-a9f0-525c-ab1c-349366fed133', 'CHIPUDE', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CIEGA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('fe8d4cd6-4050-54f2-b13f-b4a33d307a2b', 'CIEGA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DE LA GÜERA (Zona: VECINDARIO 2, Rango: 1 - 99)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('548e0bd9-7ad9-5349-a6ab-e18834ca898d', 'DE LA GÜERA', v_city_id, v_zone_id_vecindario2_9c645546, 1, 99)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DOCTOR NEGRIN (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a6724258-d1c7-51ef-a580-c55e22a03db4', 'DOCTOR NEGRIN', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DORAMAS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b79595e8-2bb8-569b-8b77-1181d54b73c4', 'DORAMAS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ECERO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3d1e36e9-c66a-5a5b-aa01-139156e39eb1', 'ECERO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ESCORIAL (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a19a1afd-3b87-5442-b0a7-dd0fdc086ab8', 'ESCORIAL', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FAMARA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1a755cfd-8a45-5b61-8eb5-29935b0f11c9', 'FAMARA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FAYCAN (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b5145249-a080-5acf-8520-8756a67e5842', 'FAYCAN', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FEMES (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8f7d34dd-ccae-5884-9880-c4fe63238c1e', 'FEMES', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARCILASO DE LA VEGA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('57378027-3f2a-55bb-80be-60afc40f2d89', 'GARCILASO DE LA VEGA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GINES DE LOS RIOS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c41a725c-df92-5d47-b50b-3ac8f8b6d8db', 'GINES DE LOS RIOS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUATIZA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('232ba306-2216-5846-a1ad-a30898d9f2a8', 'GUATIZA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HOTEL AVENIDA DE CANARIAS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ca474dce-50f9-5b04-bdce-7478d9c224a9', 'HOTEL AVENIDA DE CANARIAS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: INDALECIO PRIETO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('30d18bbd-0540-541e-8ced-4291cced6b26', 'INDALECIO PRIETO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JACINTO BENAVENTE (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2392a06e-da52-5c54-8eab-e10c8b1203d8', 'JACINTO BENAVENTE', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JOAQUIN BLUME (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('572acd0d-c482-598a-9f56-fd04d0feadbe', 'JOAQUIN BLUME', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN RAMON JIMENEZ (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('dc3153cf-a322-5a0a-b7eb-585bc73c37c3', 'JUAN RAMON JIMENEZ', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA UNION (Zona: VECINDARIO 2, Rango: 1 - 67)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('db221810-4b29-5e23-95a8-4cd3fe724bc5', 'LA UNION', v_city_id, v_zone_id_vecindario2_9c645546, 1, 67)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LEOPOLDO ALAS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('82193d22-5c7e-5262-8595-15204ed945e1', 'LEOPOLDO ALAS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LOS SABANDEÑOS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('315dbf76-4569-5777-b999-e7c4c27cb487', 'LOS SABANDEÑOS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LUIS VIVES (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('31ad3290-97a5-5b22-a0ce-46289cf82dbe', 'LUIS VIVES', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MAESTRO FALLA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cc449e74-a6d4-5161-a94d-2a8fe13d41d5', 'MAESTRO FALLA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MANUEL BECERRA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0a4ea4b7-e15f-5e38-aecf-a3cba1d22279', 'MANUEL BECERRA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MENCEYES (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('15e9e66f-269b-50af-b128-9edf7af1b7d0', 'MENCEYES', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MENENDEZ Y PELAYO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('7dede6eb-73d9-5846-a418-93e979868f83', 'MENENDEZ Y PELAYO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MIGUEL DE UNAMUNO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0ab29362-36a7-5972-b589-1d511331b162', 'MIGUEL DE UNAMUNO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MURO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ba54f8db-7061-5c75-bf8c-cae9faaa30b2', 'MURO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NUMANCIA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('1ed75f21-7d5d-5975-826a-b4e1466f51ab', 'NUMANCIA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: OBISPO FRIAS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a566ffcd-1978-561e-90cb-0dc015f73342', 'OBISPO FRIAS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PABLO IGLESIAS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('8bb46d7e-d2a3-5d8b-9cb2-6d8a487a73e4', 'PABLO IGLESIAS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARQUE DE LA ERA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5585cb33-ed8e-5759-9e9b-c1b9a9e7c0b0', 'PARQUE DE LA ERA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARQUE LA LIBERTAD (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('04eed24d-a60a-56b6-9cba-932a8979d903', 'PARQUE LA LIBERTAD', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PEPE MONAGAS (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d82d6cb3-8135-5618-9874-dcdc53e4b343', 'PEPE MONAGAS', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PRESIDENTE ZARATE (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f33e31d4-e028-5a1c-ac8a-dd7ee791f164', 'PRESIDENTE ZARATE', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PRIMERO DE MAYO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6146bc4b-bedc-5ed5-9413-a2bfe7cbd9c1', 'PRIMERO DE MAYO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RODRIGUEZ DE LA FUENTE (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('30d3ad3a-6124-531a-ab5c-226d6d6ca379', 'RODRIGUEZ DE LA FUENTE', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TALIARTE (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ba9f31e3-c615-51e4-ac19-325db3730ce3', 'TALIARTE', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('eadc69fe-b114-5c96-8b32-33bb78d75ba7', 'TAO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TARGA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0220cbd6-7d7c-5b2c-8a13-deff65d19bc0', 'TARGA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TEOBALDO POWER (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d9c83ecc-4c59-523e-9939-4b0ae3489877', 'TEOBALDO POWER', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TIRMA (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e6463f29-0ddb-51b1-b21a-9a3765cccf40', 'TIRMA', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: UNION (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f6c5bc4f-efff-554a-90de-cf5bb16f2537', 'UNION', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VESALIO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b5f0e854-a517-5ec8-a937-68057fc93ee7', 'VESALIO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VIERA Y CLAVIJO (Zona: VECINDARIO 2, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4cf9d499-42fe-5f3c-9127-9c8dd0ac1280', 'VIERA Y CLAVIJO', v_city_id, v_zone_id_vecindario2_9c645546, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ALPISPA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d75c8cf3-55f9-5d9a-b937-bbd419b91105', 'ALPISPA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AMERICO VESPUCIO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9b45859b-e505-5078-aa59-421ed4106d3c', 'AMERICO VESPUCIO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AMURGA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2e03579a-ff3a-5d26-808c-132284f9c981', 'AMURGA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ANGEL GUIMERA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('fe6e5dbf-eaf7-5253-aaba-96d1008921ef', 'ANGEL GUIMERA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ATINDANA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d9d1811e-eda4-5f66-990c-a3b30c154500', 'ATINDANA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AVENIDA LAS TIRAJANAS (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a546ace6-79ce-58a3-b96a-6a3f09ad39d2', 'AVENIDA LAS TIRAJANAS', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: AYAGAURES (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('845a3eee-6184-542a-814d-cfa8439639c3', 'AYAGAURES', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BALILLO (Zona: VECINDARIO ZONA 1, Rango: 0 - 20)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('250071fd-a4fe-57b5-b066-3ffbff89c883', 'BALILLO', v_city_id, v_zone_id_vecindariozona1_24e6285c, 0, 20)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: BENTAGUAYRE (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b2c144b0-903a-5d41-9ab8-0992fe1f55f9', 'BENTAGUAYRE', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CABEROTE (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('4d776724-2a53-5ba9-91d3-dd65202ab6a4', 'CABEROTE', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CALLE EL CABLERO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('d2b27eb8-967a-5e68-981b-ad3bf1e72b61', 'CALLE EL CABLERO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CANALEJAS (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e700478f-9c34-5a47-bea1-71b361284cb1', 'CANALEJAS', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: CERROJA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('775d8083-9569-59e5-adee-fc6bdbebd92a', 'CERROJA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DIEGO DE ORDAZ (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('2cd8e389-89fc-5a7b-9ae5-51a1597e093b', 'DIEGO DE ORDAZ', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DOCTOR CHIL (Zona: VECINDARIO ZONA 1, Rango: 0 - 7)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('34c54f04-2268-5119-a150-913eba71845a', 'DOCTOR CHIL', v_city_id, v_zone_id_vecindariozona1_24e6285c, 0, 7)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: DOCTOR MARAÑON (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('75233474-0b21-5f8e-b14a-35c70b8d5c80', 'DOCTOR MARAÑON', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FELIPE II (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('951e8152-31b7-5150-8701-31572a12853b', 'FELIPE II', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: FERNANDO DIAZ CUTILLAS (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('67f94d16-29b0-5c42-8fb4-5e4f30b519d4', 'FERNANDO DIAZ CUTILLAS', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GARCIA TELLO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3da80905-3eb8-530c-81bc-d0616a183367', 'GARCIA TELLO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GENERAL PRIM (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('50fc6db0-3a79-5530-81ca-4c738f5e327b', 'GENERAL PRIM', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GÜIMAR (Zona: VECINDARIO ZONA 1, Rango: 1 - 23)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f84948b5-fe35-5a19-b3e0-59503f60414d', 'GÜIMAR', v_city_id, v_zone_id_vecindariozona1_24e6285c, 1, 23)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: GUMIDAFE (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cd56cd37-8ff0-52f1-98a3-bd4d2a363f85', 'GUMIDAFE', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HOSTAL CASA PACO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('48379b29-3996-5418-b79f-bf45af9553ea', 'HOSTAL CASA PACO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: HOTEL VECINDARIO AEROPUERTO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('328d7765-2f7a-5e81-86ca-4abeddb1e4c7', 'HOTEL VECINDARIO AEROPUERTO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: ICOD (Zona: VECINDARIO ZONA 1, Rango: 0 - 2)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5a7f278d-9fb8-57ee-953c-423e70cb78c7', 'ICOD', v_city_id, v_zone_id_vecindariozona1_24e6285c, 0, 2)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: IRIARTE (Zona: VECINDARIO ZONA 1, Rango: 1 - 19)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c2fc07f0-6af2-5ce2-88a2-daa58977bdb0', 'IRIARTE', v_city_id, v_zone_id_vecindariozona1_24e6285c, 1, 19)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN BOSCH MILLARES (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ac892e69-a250-5890-8b39-b70205f7ddd2', 'JUAN BOSCH MILLARES', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN DE BETHENCOURT (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('3023d4f6-5a88-527b-88d6-621c61fea809', 'JUAN DE BETHENCOURT', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: JUAN DE QUESADA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b5c6ef79-b7a3-5ea5-8988-0e6c8bba60f4', 'JUAN DE QUESADA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LA GUERA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('58d00baa-32e4-5629-b41b-17cc72b4d843', 'LA GUERA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: LEON Y CASTILLO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9e0f2725-0473-5b34-a389-d03bd16fe622', 'LEON Y CASTILLO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MALAGUEÑA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('a1615875-7bf5-53b1-bdbe-ff230bf4021e', 'MALAGUEÑA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MANOLO MILLARES (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('bc25d1e5-9a5e-5e4e-81be-cba4f783a122', 'MANOLO MILLARES', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: MURCIA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('5d74641d-ce51-5d7a-83da-baaf9fa31f26', 'MURCIA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NESTOR DE LA TORRE (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cc8d8930-413b-5b11-a08a-725aac1bfb4d', 'NESTOR DE LA TORRE', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NICOLAS ESTEVANEZ (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('53281ee6-e65a-546e-948b-96b62723cbf3', 'NICOLAS ESTEVANEZ', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: NICOLAS MASSIEU (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ac75c8f2-ac55-5549-b5aa-4edb1bba6914', 'NICOLAS MASSIEU', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: OROVAL (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('b1bbb645-911f-5adf-ab2b-362c757d43b2', 'OROVAL', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PADRE VILLEN (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('9bfaf17a-2868-5bdf-bd48-5a3345afa672', 'PADRE VILLEN', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PAMO CHAMOSO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('26656424-52be-53cc-b28d-f562aa43b478', 'PAMO CHAMOSO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARACELSO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('f8c7d7ec-bf48-5b30-92a4-3e9e38b085df', 'PARACELSO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARAGUAY (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('6a6509b1-d7b8-5bd0-981b-b6ef50a22278', 'PARAGUAY', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARQUE SAN BORONDON (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ac8e6562-e3ac-5713-8ece-b265bb11235a', 'PARQUE SAN BORONDON', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PARTILES (Zona: VECINDARIO ZONA 1, Rango: 1 - 2)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('0640b9f1-7067-5831-a24e-35b127412377', 'PARTILES', v_city_id, v_zone_id_vecindariozona1_24e6285c, 1, 2)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PASAJE EMPAQUETADORA (Zona: VECINDARIO ZONA 1, Rango: 0 - 20)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('cd40e989-608b-5948-a5b8-e4fd9187c1a5', 'PASAJE EMPAQUETADORA', v_city_id, v_zone_id_vecindariozona1_24e6285c, 0, 20)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PASAJE UCANCA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('c2d40276-530d-5d18-98fc-1594b1afced9', 'PASAJE UCANCA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PINTOR ANTONIO PADRON (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('89dfdc66-a148-5bd9-ae07-a050494a6b58', 'PINTOR ANTONIO PADRON', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: PINTOR RODRIGUEZ ACOSTA (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('58e479e9-0e06-59dc-9d48-7192427727a7', 'PINTOR RODRIGUEZ ACOSTA', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: RAMON Y CAJAL (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('de9b04a6-21a9-5466-99c4-966f149b2a43', 'RAMON Y CAJAL', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SAN PEDRO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('99cae5ee-6cb3-5958-8fd0-b2f819ad5fbe', 'SAN PEDRO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: SANTIAGO MARCIAL (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('e2929d9a-ae3a-5531-bb0a-d48686e127d5', 'SANTIAGO MARCIAL', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAMARAN (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('fe9b772b-b9ff-57fc-94c9-972770cde6a8', 'TAMARAN', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAMOGANTE (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('ac66eac0-2491-5b1f-a5be-2b06eb3b7e62', 'TAMOGANTE', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: TAZARTICO (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('958313a2-eae2-5ff6-8b3f-a6e0b52480ec', 'TAZARTICO', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VEINTINUEVE DE ABRIL (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('622141a4-ac07-528a-91e4-670c7ade2902', 'VEINTINUEVE DE ABRIL', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;
    -- Calle: VICENTE ALEIXANDRE (Zona: VECINDARIO ZONA 1, Rango: NULL - NULL)
    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)
    VALUES ('09ca2da8-ab2a-5e95-95ce-ae9e49525fe7', 'VICENTE ALEIXANDRE', v_city_id, v_zone_id_vecindariozona1_24e6285c, NULL, NULL)
    ON CONFLICT (id) DO NOTHING;

END $$;