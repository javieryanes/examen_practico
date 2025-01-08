-- Crear base de datos

CREATE DATABASE farmacia;
\c farmacia


-- Crear todas las tablas necesarias
CREATE TABLE LABORATORIO (
    id_laboratorio SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    ciudad VARCHAR(255),
    calle VARCHAR(255),
    npostal NUMERIC(5),
    telefono NUMERIC,
    fax VARCHAR(20),
    nombre_persona VARCHAR(255)
);
CREATE TABLE MEDICAMENTO (
    id_medicamento SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    stock NUMERIC,
    venta_libre VARCHAR(2),
    precio DECIMAL(10.2),
    uds_vendidas NUMERIC,
    tipo VARCHAR(255),
    id_lab INTEGER,
    FOREIGN KEY(id_lab) REFERENCES LABORATORIO(id_laboratorio)
);
CREATE TABLE FAMILIA (
    id_familia INTEGER PRIMARY KEY,
    nombre_familia VARCHAR(255),
    id_medicamento INTEGER PRIMARY KEY,
    FOREIGN KEY(id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
);
CREATE TABLE COMPRA (
    id_compra SERIAL PRIMARY KEY,
    importe NUMERIC,
    cantidad NUMERIC CHECK (cantidad > 0),
    fecha_compra DATE,
    es_credito VARCHAR(2),
    id_medicamento INTEGER,
    FOREIGN KEY(id_medicamento) REFERENCES MEDICAMENTO(id_medicamento),
    DNI NUMERIC(8),
    FOREIGN KEY(DNI) REFERENCES CLIENTE_CREDITO(DNI)
);
CREATE TABLE CLIENTE_CREDITO (
    dni NUMERIC(8) PRIMARY KEY,
    IBAN NUMERIC(20),
    n_tarjeta NUMERIC(16),
    nombre VARCHAR(255),
    fecha_pago DATE
);


-- Insertar 5 filas en todas las tablas
INSERT INTO LABORATORIO(nombre, ciudad, calle, npostal, telefono, fax, nombre_persona) VALUES 
('laboratorio benitez', 'Realejos', 'San juan', '38800', 12345678, ' fax@benitez', 'Alberto'),
('herbolario yanes', 'La Laguna', 'trinidad', '99900', 45678945, ' fax@trinidad', 'Laura'),
('laboratorio gutierrez', 'Tanque', 'heraclio', '88800', 87654321, ' fax@heraclio', 'Rosa'),
('laboratorio  fonteide', 'Vilaflor', 'cartaya', '67800', 32165412, ' fax@Vilaflor', 'Marta'),
('farmaceutica aguas', 'Santa cruz', 'avenida', '40800', 15963333, ' fax@avebnida', 'Lolito');

INSERT INTO MEDICAMENTO(nombre, stock, venta_libre, precio, uds_vendidas, tipo, id_lab) VALUES 
('paracetamol', 55, 'si', 1.25, 23, 'pastilla', 1),
('agua micelar', 89, 'no', 11.25, 9, 'pomada', 1),
('inhalador premium', 55, 'si', 45.60, 10, 'inhalador', 5),
('amoxicilina', 45, 'no', 63.25, 13, 'polvo', 3),
('ibuprofeno', 80, 'si', 0.3, 66, 'pastilla', 2);

INSERT INTO FAMILIA(nombre_familia, id_medicamento) VALUES
('cremas corporales', 4),
('dolor de cabeza', 1),
('dolor de cabeza', 5),
('piel', 2),
('asma', 3);

INSERT INTO CLIENTE_CREDITO(dni, IBAN, n_tarjeta, nombre, fecha_pago) VALUES
(12345678, 12345678901234567890, 1234567891234567, 'Juan', '10-10-2021'),
(98765432, 03216549870321654987, 1472583691472583, 'Alberto', '10-03-2023'),
(15645455, 18641669431641343313, 2126548564578456, 'Javier', '10-03-2023'),
(45556778, 75688524727275272833, 5498465486456465, 'Laura', '10-10-2021'),
(78954532, 45671398717147337137, 6416694316413233, 'Luisa', '10-11-2024');

INSERT INTO COMPRA (cantidad, fecha_compra, es_credito, id_medicamento, dni) VALUES
(5, '10-03-2023', 'no', 4, NULL),
(1, '04-02-2024', 'si', 4, 12345678),
(23, '10-10-2021', 'no', 2, NULL),
(15, '20-08-2023', 'si', 1, 98765432),
(9, '18-11-2023', 'no', 5, NULL);


