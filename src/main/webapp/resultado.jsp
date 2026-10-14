<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado - Pollos ElDorado</title>
    <style>
        :root {
            --verde-oscuro: #1b4332;
            --verde-medio: #2d6a4f;
            --verde-exito: #2d6a4f;
            --verde-suave: #e8f5e9;
            --amarillo-dorado: #e5a93b;
            --texto-oscuro: #1f2937;
            --texto-muted: #6b7280;
            --borde: #e5e7eb;
            --blanco: #ffffff;
            --rojo-error: #c53030;
            --rojo-fondo: #fff5f5;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f7f4;
            color: var(--texto-oscuro);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .contenedor {
            background-color: var(--blanco);
            width: 100%;
            max-width: 520px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(27, 67, 50, 0.08);
            border: 1px solid var(--borde);
            overflow: hidden;
        }

        .franja-dorada {
            height: 6px;
            background: linear-gradient(90deg, var(--amarillo-dorado), #f59e0b);
        }

        .encabezado {
            background-color: var(--verde-oscuro);
            color: var(--blanco);
            padding: 22px 28px;
            text-align: center;
        }

        .encabezado h1 {
            font-size: 1.6rem;
            margin-bottom: 2px;
        }

        .encabezado .subtitulo {
            font-size: 0.88rem;
            color: #d8f3dc;
        }

        .cuerpo {
            padding: 26px 28px;
        }

        .alerta-exito {
            background-color: var(--verde-suave);
            border-left: 4px solid var(--verde-medio);
            color: var(--verde-oscuro);
            padding: 14px 16px;
            border-radius: 6px;
            margin-bottom: 22px;
            font-size: 0.95rem;
            font-weight: 600;
        }

        .alerta-error {
            background-color: var(--rojo-fondo);
            border-left: 4px solid var(--rojo-error);
            color: var(--rojo-error);
            padding: 14px 16px;
            border-radius: 6px;
            margin-bottom: 22px;
            font-size: 0.9rem;
        }

        .tarjeta-detalle {
            background-color: #fafbfc;
            border: 1px solid #edf2f7;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 22px;
        }

        .fila-dato {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eef2f6;
            font-size: 0.93rem;
        }

        .fila-dato:last-child {
            border-bottom: none;
        }

        .fila-dato .etiqueta {
            font-weight: 600;
            color: #4b5563;
        }

        .fila-dato .valor {
            font-weight: 500;
            color: #111827;
            text-align: right;
            max-width: 60%;
            word-break: break-word;
        }

        .btn-volver {
            display: block;
            width: 100%;
            text-align: center;
            padding: 13px;
            background-color: var(--verde-medio);
            color: var(--blanco);
            text-decoration: none;
            border-radius: 8px;
            font-size: 0.98rem;
            font-weight: 600;
            transition: background-color 0.2s ease;
        }

        .btn-volver:hover {
            background-color: var(--verde-oscuro);
        }

        .pie {
            text-align: center;
            font-size: 0.78rem;
            color: var(--texto-muted);
            padding: 14px 28px 20px;
            border-top: 1px solid #f3f4f6;
        }
    </style>
</head>
<body>

    <main class="contenedor">
        <div class="franja-dorada"></div>

        <header class="encabezado">
            <h1>Pollos ElDorado</h1>
            <p class="subtitulo">Sistema de control avícola &bull; Confirmación</p>
        </header>

        <section class="cuerpo">
            <%
                String errorBD = (String) request.getAttribute("errorBD");
                Object idObj = request.getAttribute("id");
                int idGenerado = (idObj instanceof Integer) ? (Integer) idObj : 0;
            %>

            <% if (errorBD != null && !errorBD.isEmpty()) { %>
                <div class="alerta-error">
                    <strong>Aviso de Base de Datos:</strong>
                    <p style="margin-top: 4px; font-weight: normal;"><%= errorBD %></p>
                </div>
            <% } else { %>
                <div class="alerta-exito">
                    &#10004; ¡Reporte <%= (idGenerado > 0 ? ("#" + idGenerado) : "") %> registrado con éxito en MySQL!
                </div>
            <% } %>

            <div class="tarjeta-detalle">
                <% if (idGenerado > 0) { %>
                <div class="fila-dato">
                    <span class="etiqueta">ID de registro:</span>
                    <span class="valor">#<%= idGenerado %></span>
                </div>
                <% } %>

                <div class="fila-dato">
                    <span class="etiqueta">Número de galpón:</span>
                    <span class="valor">Galpón <%= request.getAttribute("galpon") != null ? request.getAttribute("galpon") : "-" %></span>
                </div>

                <div class="fila-dato">
                    <span class="etiqueta">Pollos muertos:</span>
                    <span class="valor"><%= request.getAttribute("cantidad") != null ? request.getAttribute("cantidad") : "0" %> aves</span>
                </div>

                <div class="fila-dato">
                    <span class="etiqueta">Observaciones:</span>
                    <span class="valor">
                        <%= (request.getAttribute("observaciones") != null && !((String)request.getAttribute("observaciones")).trim().isEmpty())
                                ? request.getAttribute("observaciones")
                                : "<em>Sin observaciones</em>" %>
                    </span>
                </div>
            </div>

            <a href="index.html" class="btn-volver">Registrar otro reporte</a>
        </section>

        <footer class="pie">
            Pollos ElDorado &bull; Registro Operativo Avícola &bull; SENA
        </footer>
    </main>

</body>
</html>
