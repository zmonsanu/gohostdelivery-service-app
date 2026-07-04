import sys
import csv
import uuid
import os

def get_uuid(name):
    # Genera un UUID determinista basado en el nombre para consistencia
    return str(uuid.uuid5(uuid.NAMESPACE_DNS, name.strip().lower()))

def main():
    if len(sys.argv) < 2:
        print("Uso: python generate_streets_sql.py <archivo_csv> [archivo_salida_sql]")
        print("Ejemplo: python generate_streets_sql.py calles.csv insert_streets.sql")
        sys.exit(1)

    csv_path = sys.argv[1]
    sql_path = sys.argv[2] if len(sys.argv) > 2 else "insert_streets.sql"

    if not os.path.exists(csv_path):
        print(f"Error: El archivo CSV no existe en la ruta: {csv_path}")
        sys.exit(1)

    city_name = "Vecindario"
    city_uuid = get_uuid(f"city:{city_name}")

    zones = set()
    streets_data = []

    def add_row_to_streets(row):
        if not row or len(row) < 2:
            return
        calle = row[0].strip()
        zona = row[1].strip()
        num_min = row[2].strip() if len(row) > 2 else ""
        num_max = row[3].strip() if len(row) > 3 else ""

        if not calle:
            return

        if zona:
            zones.add(zona)

        streets_data.append({
            "nombre": calle,
            "zona": zona,
            "num_min": num_min,
            "num_max": num_max
        })

    with open(csv_path, mode='r', encoding='utf-8-sig') as f:
        reader = csv.reader(f)
        first_row = next(reader, None)
        if first_row:
            # Comprobar si la primera fila es una cabecera
            if first_row[0].strip().lower() in ["calle", "nombre", "street", "street_name", "streetname", "direccion", "dirección"]:
                pass  # Saltar cabecera
            else:
                add_row_to_streets(first_row)

            for row in reader:
                add_row_to_streets(row)

    # Construir el script SQL
    sql_content = []
    sql_content.append("-- ===========================================================")
    sql_content.append(f"-- SQL Generado automáticamente para la ciudad: {city_name}")
    sql_content.append(f"-- Total Zonas: {len(zones)} | Total Calles: {len(streets_data)}")
    sql_content.append("-- ===========================================================\n")
    sql_content.append("DO $$")
    sql_content.append("DECLARE")
    sql_content.append("    v_company_id UUID;")
    sql_content.append(f"    v_city_id UUID := '{city_uuid}';")

    # Declarar variables de ID de zona deterministas
    zone_uuid_map = {}
    for zone_name in sorted(zones):
        clean_zone_name = "".join(c for c in zone_name if c.isalnum() or c == '_')
        zone_var = f"v_zone_id_{clean_zone_name.lower()}_{get_uuid(zone_name)[:8]}"
        zone_uuid = get_uuid(f"zone:{zone_name}")
        zone_uuid_map[zone_name] = {
            "var": zone_var,
            "uuid": zone_uuid
        }
        sql_content.append(f"    {zone_var} UUID := '{zone_uuid}';")

    sql_content.append("BEGIN")
    sql_content.append("    -- Obtener la primera compañía disponible en el sistema")
    sql_content.append("    SELECT id INTO v_company_id FROM companies LIMIT 1;")
    sql_content.append("    IF v_company_id IS NULL THEN")
    sql_content.append("        RAISE EXCEPTION 'No se encontró ninguna compañía registrada en la tabla \"companies\". Por favor, crea una compañía primero.';")
    sql_content.append("    END IF;\n")

    sql_content.append("    -- 1. Insertar Ciudad (Vecindario)")
    sql_content.append("    INSERT INTO cities (id, nombre, provincia, comunidad_autonoma)")
    sql_content.append(f"    VALUES (v_city_id, '{city_name}', 'Las Palmas', 'Canarias')")
    sql_content.append("    ON CONFLICT (id) DO NOTHING;\n")

    sql_content.append("    -- 2. Insertar Zonas")
    for zone_name in sorted(zones):
        zinfo = zone_uuid_map[zone_name]
        sql_content.append(f"    -- Zona: {zone_name}")
        sql_content.append("    INSERT INTO zones (id_zone, id_company, id_city, importe_zona_centro, importe_zona_periferica, descripcion)")
        sql_content.append(f"    VALUES ({zinfo['var']}, v_company_id, v_city_id, 3.50, 5.00, 'Zona {zone_name} en {city_name}')")
        sql_content.append("    ON CONFLICT (id_zone) DO NOTHING;\n")

    sql_content.append("    -- 3. Insertar Calles con sus rangos y zonas asociadas")
    for street in streets_data:
        street_uuid = get_uuid(f"street:{street['nombre']}:{street['zona']}:{street['num_min']}:{street['num_max']}")
        zname = street["zona"]
        z_id_val = zone_uuid_map[zname]["var"] if zname else "NULL"
        
        min_val = street["num_min"] if street["num_min"] else "NULL"
        max_val = street["num_max"] if street["num_max"] else "NULL"

        sql_content.append(f"    -- Calle: {street['nombre']} (Zona: {zname if zname else 'Ninguna'}, Rango: {min_val} - {max_val})")
        sql_content.append("    INSERT INTO streets (id, nombre, id_city, id_zone, num_min, num_max)")
        sql_content.append(f"    VALUES ('{street_uuid}', '{street['nombre']}', v_city_id, {z_id_val}, {min_val}, {max_val})")
        sql_content.append("    ON CONFLICT (id) DO NOTHING;")

    sql_content.append("\nEND $$;")

    with open(sql_path, mode='w', encoding='utf-8') as out_f:
        out_f.write("\n".join(sql_content))

    print(f"Script SQL generado con éxito en: {sql_path}")
    print(f"Total zonas procesadas: {len(zones)}")
    print(f"Total calles procesadas: {len(streets_data)}")

if __name__ == "__main__":
    main()
