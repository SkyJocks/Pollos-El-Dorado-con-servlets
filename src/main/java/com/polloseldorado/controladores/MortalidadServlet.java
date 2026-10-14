package com.polloseldorado.controladores;

import com.polloseldorado.conexion.Conexion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Controlador para la gestión y registro de mortalidad de aves.
 * Proyecto: Pollos ElDorado - SENA
 */
@WebServlet("/mortalidad")
public class MortalidadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige al formulario principal
        request.getRequestDispatcher("/index.html").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Configuración para caracteres en español (tildes, ñ)
        request.setCharacterEncoding("UTF-8");

        // 1. Obtener parámetros del formulario
        String galponTexto = request.getParameter("galpon");
        String cantidadTexto = request.getParameter("cantidad");
        String observaciones = request.getParameter("observaciones");

        // Limpieza básica de observaciones
        if (observaciones != null) {
            observaciones = observaciones.trim();
        }

        try {
            // 2. Validaciones básicas de negocio
            int galpon = Integer.parseInt(galponTexto);
            int cantidad = Integer.parseInt(cantidadTexto);

            if (galpon <= 0 || cantidad <= 0) {
                throw new IllegalArgumentException("El número de galpón y la cantidad deben ser mayores a cero.");
            }

            // 3. Inserción en base de datos MySQL mediante JDBC
            String sql = "INSERT INTO mortalidad (galpon, cantidad, observaciones) VALUES (?, ?, ?)";
            int idGenerado = 0;
            String errorBD = null;

            try (Connection conexion = Conexion.getConnection();
                 PreparedStatement ps = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

                // Asignar parámetros a la sentencia preparada (evita SQL Injection)
                ps.setInt(1, galpon);
                ps.setInt(2, cantidad);
                ps.setString(3, (observaciones != null && !observaciones.isEmpty()) ? observaciones : null);

                // Ejecutar el INSERT
                ps.executeUpdate();

                // Obtener el ID autoincremental generado
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        idGenerado = rs.getInt(1);
                    }
                }
            } catch (SQLException e) {
                // Registrar error en la consola del servidor
                System.err.println("Error de base de datos al registrar mortalidad: " + e.getMessage());
                errorBD = e.getMessage();
            }

            // 4. Compartir datos con la vista resultado.jsp
            request.setAttribute("id", idGenerado);
            request.setAttribute("galpon", galpon);
            request.setAttribute("cantidad", cantidad);
            request.setAttribute("observaciones", observaciones);
            request.setAttribute("errorBD", errorBD);

            // Reenviar a la vista JSP
            request.getRequestDispatcher("/resultado.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Por favor ingresa valores numéricos válidos para el galpón y la cantidad."
            );
        } catch (IllegalArgumentException e) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                e.getMessage()
            );
        }
    }
}
