-- Crear base de datos (evita usar "postgres")
CREATE DATABASE postgres;
\c postgres;

-- Crear tabla de usuarios
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    modified TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    last_login TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    token TEXT NOT NULL,
    isactive BOOLEAN DEFAULT TRUE
);

-- Crear tabla de teléfonos
CREATE TABLE phones (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    number VARCHAR(20) NOT NULL,
    citycode VARCHAR(10) NOT NULL,
    countrycode VARCHAR(10) NOT NULL
);

-- Insertar usuarios de prueba
INSERT INTO users (id, name, email, password, token, isactive) VALUES
    ('550e8400-e29b-41d4-a716-446655440000', 'Juan Rodriguez', 'juan@rodriguez.org', 'hunter2', 'token-juan', TRUE),
    ('660e8400-e29b-41d4-a716-446655440001', 'Ana Perez', 'ana@perez.org', 'claveSegura123', 'token-ana', TRUE),
    ('770e8400-e29b-41d4-a716-446655440002', 'Carlos Lopez', 'carlos@lopez.org', 'contraseña123', 'token-carlos', TRUE),
    ('880e8400-e29b-41d4-a716-446655440003', 'Maria Gonzalez', 'maria@gonzalez.org', 'claveSegura321', 'token-maria', TRUE),
    ('990e8400-e29b-41d4-a716-446655440004', 'Pedro Martinez', 'pedro@martinez.org', 'password456', 'token-pedro', TRUE),
    ('aa0e8400-e29b-41d4-a716-446655440005', 'Laura Fernandez', 'laura@fernandez.org', 'claveSegura654', 'token-laura', TRUE),
    ('bb0e8400-e29b-41d4-a716-446655440006', 'Jose Ruiz', 'jose@ruiz.org', 'contraseña789', 'token-jose', TRUE),
    ('cc0e8400-e29b-41d4-a716-446655440007', 'Elena Torres', 'elena@torres.org', 'claveSegura987', 'token-elena', TRUE),
    ('dd0e8400-e29b-41d4-a716-446655440008', 'Luis Alvarez', 'luis@alvarez.org', 'password321', 'token-luis', TRUE),
    ('ee0e8400-e29b-41d4-a716-446655440009', 'Sandra Hernandez', 'sandra@hernandez.org', 'contraseña654', 'token-sandra', TRUE);

-- Verificar que los usuarios existen antes de insertar los teléfonos
SELECT * FROM users;

-- Insertar teléfonos de prueba
INSERT INTO phones ("userId", number, citycode, countrycode) VALUES
    ('550e8400-e29b-41d4-a716-446655440000', '1234567', '1', '57'),
    ('660e8400-e29b-41d4-a716-446655440001', '9876543', '2', '34'),
    ('770e8400-e29b-41d4-a716-446655440002', '2345678', '3', '56'),
    ('880e8400-e29b-41d4-a716-446655440003', '8765432', '4', '44'),
    ('990e8400-e29b-41d4-a716-446655440004', '3456789', '5', '33'),
    ('aa0e8400-e29b-41d4-a716-446655440005', '7654321', '6', '22'),
    ('bb0e8400-e29b-41d4-a716-446655440006', '4567890', '7', '11'),
    ('cc0e8400-e29b-41d4-a716-446655440007', '5678901', '8', '99'),
    ('dd0e8400-e29b-41d4-a716-446655440008', '6789012', '9', '77'),
    ('ee0e8400-e29b-41d4-a716-446655440009', '7890123', '10', '88');
