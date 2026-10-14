# Pollos ElDorado — Sistema de Control Avícola 🐔

> **Evidencia SENA:** GA7-220501096-AA2-EV02  
> **Actividad:** Módulos de software codificados y probados  
> **Programa:** Tecnólogo en Análisis y Desarrollo de Software (ADSO)

---

## 📌 Descripción del Módulo
Módulo web para el registro diario de mortalidad de pollos por galpón en una granja avícola. Implementa el patrón arquitectónico **MVC (Modelo-Vista-Controlador)** con persistencia en **MySQL** mediante **JDBC**.

---

## 🛠️ Tecnologías Utilizadas
* **Lenguaje:** Java 21
* **Controlador:** Java Servlets (`jakarta.servlet-api` 6.0)
* **Vista:** HTML5, CSS3 responsivo y JSP (`resultado.jsp`)
* **Modelo / Persistencia:** MySQL 8.0 vía JDBC (`mysql-connector-j` 9.4.0)
* **Servidor de Aplicaciones:** Apache Tomcat 10.1.61
* **Empaquetado y Construcción:** Apache Maven (empaquetado `.war`)

---

## 🏛️ Arquitectura del Sistema (MVC)
* **Vista (`View`):**
  * `src/main/webapp/index.html`: Formulario de captura con validaciones HTML5.
  * `src/main/webapp/resultado.jsp`: Vista dinámica con los datos guardados y el ID autoincremental de MySQL.
* **Controlador (`Controller`):**
  * `MortalidadServlet.java`: Recibe peticiones HTTP POST, valida rangos positivos, ejecuta sentencias con `PreparedStatement` y direcciona a la vista.
* **Modelo (`Model`):**
  * `Conexion.java`: Administra el ciclo de conexión a MySQL vía `DriverManager`.
  * `mortalidad` (Tabla MySQL): Almacena ID, galpón, cantidad, observaciones y fecha de registro.

---

## 🚀 Puesta en Marcha

### 1. Base de Datos
Ejecuta el script SQL incluido en la raíz:
```sql
SOURCE schema.sql;
```

### 2. Compilar con Maven
En la raíz del proyecto:
```bash
mvn clean package
```
Generará el paquete `target/pollos-eldorado.war`.

### 3. Despliegue en Tomcat 10
Copia el archivo `pollos-eldorado.war` a la carpeta `webapps/` de tu instalación de Tomcat e inicia el servidor:
```bash
startup.bat
```

### 4. Acceso en el Navegador
```text
http://localhost:8080/pollos-eldorado/
```
