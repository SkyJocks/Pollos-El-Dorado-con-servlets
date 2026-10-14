package com.polloseldorado.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase de utilidad para gestionar la conexión a la base de datos MySQL.
 * Proyecto: Pollos ElDorado - SENA
 */
public class Conexion {

    // Parámetros de conexión a MySQL
    private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/pollos_eldorado?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USUARIO = "root";
    private static final String CLAVE = "Cuenta123.";

    /**
     * Obtiene una conexión activa a la base de datos pollos_eldorado.
     * @return Objeto Connection listo para ejecutar consultas.
     * @throws SQLException Si ocurre un error al conectar.
     */
    public static Connection getConnection() throws SQLException {
        try {
            // 1. Cargar el controlador JDBC de MySQL en memoria
            Class.forName(CONTROLADOR);
        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el driver JDBC de MySQL.");
            throw new SQLException("Error al cargar el controlador de base de datos", e);
        }

        // 2. Establecer y retornar la conexión
        return DriverManager.getConnection(URL, USUARIO, CLAVE);
    }
}
