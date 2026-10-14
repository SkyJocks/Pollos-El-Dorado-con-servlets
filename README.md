# Pollos ElDorado — Sistema de Control Avícola 🐔

**Evidencia SENA:** GA7-220501096-AA2-EV02  
**Actividad:** Módulos de software codificados y probados  
**Programa:** Tecnólogo en Análisis y Desarrollo de Software (ADSO)

## 1. Descripción del proyecto

Pollos ElDorado es un sistema web pensado para llevar un control de la mortalidad de los pollos en una granja avícola. Permite registrar el número del galpón, la cantidad de pollos muertos y las observaciones correspondientes.

La información se guarda en una base de datos MySQL para facilitar su consulta y mantener un registro de los datos ingresados.

## 2. Tecnologías utilizadas

Para desarrollar este módulo se utilizan las siguientes herramientas:

- **Java 21:** para programar la lógica del sistema.
- **HTML y CSS:** para crear el formulario y darle una presentación sencilla.
- **Java Servlets:** para recibir y procesar los datos enviados desde el formulario.
- **JSP:** para mostrar el resultado del registro.
- **MySQL 8.0:** para almacenar la información.
- **JDBC:** para conectar Java con la base de datos.
- **Apache Tomcat 10.1.61:** para ejecutar la aplicación web.
- **Apache Maven:** para compilar el proyecto y generar el archivo WAR.

## 3. Organización del sistema

El proyecto está organizado en tres partes principales:

**Vista:** contiene el archivo `index.html`, donde se ingresan los datos, y `resultado.jsp`, que muestra el resultado del registro.

**Controlador:** está en `MortalidadServlet.java`. Se encarga de recibir los datos del formulario, validar la información y procesar el registro.

**Conexión y almacenamiento:** la clase `Conexion.java` permite conectar el sistema con MySQL mediante JDBC. La tabla `mortalidad` almacena el número del galpón, la cantidad de pollos muertos, las observaciones y la fecha del registro.

Esta organización ayuda a mantener el código ordenado y facilita realizar cambios en el sistema.

## 4. Pasos para ejecutar el proyecto

### 4.1. Configurar la base de datos

Primero, se debe crear la base de datos y la tabla necesarias para guardar los registros. Si se utiliza el archivo `schema.sql`, se puede ejecutar desde MySQL con el comando:

```sql
SOURCE schema.sql;
```

### 4.2. Compilar el proyecto

Desde la carpeta principal del proyecto, se ejecuta el siguiente comando:

```bash
mvn clean package
```

Si la compilación termina correctamente, se genera el archivo `pollos-eldorado.war` dentro de la carpeta `target`.

### 4.3. Ejecutar en Tomcat

Se copia el archivo WAR en la carpeta `webapps` de Apache Tomcat. Después, se inicia el servidor para que cargue la aplicación.

### 4.4. Abrir el sistema

Cuando Tomcat esté funcionando, se puede ingresar desde el navegador a la siguiente dirección:

http://localhost:8080/pollos-eldorado/

Desde allí se podrá acceder al formulario de registro de mortalidad.

## 5. Resultado esperado

Con este módulo se busca facilitar el registro de la mortalidad de los pollos por galpón y conservar la información en una base de datos. También permite practicar el uso de Java, Servlets, JSP, JDBC y MySQL en el desarrollo de una aplicación web.