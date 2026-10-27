-- SCRIPT DE INICIALIZACIÓN Y SEMILLA (100 REGISTROS) - ANDY'S PIPEART

CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    rol_id INT REFERENCES roles(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS productos_catalogo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE IF NOT EXISTS pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES usuarios(id),
    fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_entrega DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    anticipo DECIMAL(10,2) NOT NULL,
    estado VARCHAR(50) DEFAULT 'Solicitado'
);

CREATE TABLE IF NOT EXISTS pagos_anticipos (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id),
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    verificado BOOLEAN DEFAULT FALSE
);

-- Inserción de Roles
INSERT INTO roles (nombre_rol) VALUES ('Cliente'), ('Artesano') ON CONFLICT DO NOTHING;

-- Inserción de Usuarios de prueba (Administrador y Clientes)
INSERT INTO usuarios (nombre, correo, password_hash, rol_id) VALUES 
('Andrea Lopez', 'admin@andypipeart.com', 'hash_seguro_admin', 2),
('Cliente Uno', 'cliente1@gmail.com', 'hash_seguro_1', 1),
('Cliente Dos', 'cliente2@gmail.com', 'hash_seguro_2', 1)
ON CONFLICT DO NOTHING;

-- Inserción de Productos del Catálogo base
INSERT INTO productos_catalogo (nombre, descripcion, precio_base, stock) VALUES 
('Ramo de Girasoles de Limpiapipas', 'Hermoso ramo artesanal de girasoles amarillos', 350.00, 20),
('Tulipanes Pastel', 'Set de 6 tulipanes en tonos pastel (rosa, morado, azul)', 280.00, 15),
('Margaritas y Margaritas con Base', 'Arreglo floral decorativo con maceta personalizada', 400.00, 10)
ON CONFLICT DO NOTHING;
