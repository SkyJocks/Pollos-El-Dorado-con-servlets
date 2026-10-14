-- ==============================================================
-- SISTEMA DE CONTROL AVÍCOLA - POLLOS ELDORADO
-- Evidencia SENA: Codificación de módulos de software
-- Base de datos: pollos_eldorado
-- ==============================================================

CREATE DATABASE IF NOT EXISTS pollos_eldorado
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE pollos_eldorado;

CREATE TABLE IF NOT EXISTS mortalidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    galpon INT NOT NULL,
    cantidad INT NOT NULL,
    observaciones VARCHAR(500),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
