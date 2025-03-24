# Desafío Backend: NestJS - Gestión de Usuarios

Este proyecto implementa una API RESTful para la gestión de usuarios, cumpliendo con los requisitos del desafío backend.

## Descripción

La API expone funcionalidades para la creación, obtención, modificación y eliminación lógica de usuarios, utilizando NestJS y PostgreSQL.

## Funcionalidades

La API RESTful implementa los siguientes endpoints:

###   Registro de Usuario

* `POST /users`
*     Recibe los campos: `name`, `email`, `password` y un array de objetos `phones` (number, citycode, countrycode). Todos los campos son obligatorios. [cite: 23]
*     Valida que el email tenga el formato correcto (expresión regular). [cite: 26, 27]
*     Valida que la contraseña tenga el formato correcto (expresión regular configurable). [cite: 27, 28]
*     Si el email ya existe, retorna un error. [cite: 25]
*     Retorna el usuario creado con los campos: `id` (UUID), `created`, `modified`, `last_login`, `token` (UUID o JWT), `isactive`. [cite: 23, 24]
*     Código de estado HTTP adecuado en caso de éxito o error. [cite: 23]

###   Obtener Todos los Usuarios

* `GET /users`
*     Devuelve un array con la lista completa de usuarios registrados. [cite: 28, 29, 30]
*     Respuestas de error: 400 Bad Request (parámetros de consulta incorrectos), 500 Internal Server Error (error inesperado). [cite: 31, 32]

###   Obtener Usuario por ID

* `GET /users/:id`
*     Obtiene los detalles de un usuario específico por su ID (UUID). [cite: 33, 34, 35, 36, 37, 38, 39]
*     Respuestas de error: 404 Not Found (usuario no encontrado), 400 Bad Request (ID inválido), 500 Internal Server Error (error inesperado). [cite: 36, 37, 38]

###   Eliminar Usuario por ID

* `DELETE /users/:id`
*     Elimina lógicamente un usuario por su ID (UUID). [cite: 39, 40, 41, 42, 43, 44, 45]
*     Respuestas de error: 404 Not Found (usuario no encontrado), 400 Bad Request (ID inválido), 500 Internal Server Error (error inesperado). [cite: 42, 43, 44, 45]

##   Estructura del Proyecto

src: Directorio del código fuente.
common:
entities: Entidad base que extiende variables comunes y define comportamientos pre-insertar y actualizar.
pipes: Validadores personalizados para endpoints.
config:
app.config.ts: Carga la configuración del puerto de la aplicación.
modules:
users: Módulo base que controla la lógica de usuarios.
app.module.ts: Módulo principal de la aplicación.
main.ts: Punto de entrada de la aplicación.
.env: Archivo de variables de entorno.
.eslintrc.js: Reglas de buenas prácticas de programación.
.gitignore: Archivos y directorios ignorados por Git.
.prettierrc.js: Configuración para trabajar con ESLint.
package.json: Archivo de configuración de NPM.
tsconfig.json: Archivo de configuración de TypeScript.

##   Configuración de Entorno

Para el desarrollo, se utiliza un archivo `.env` para gestionar las variables de entorno:

PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_NAME=postgres
DB_USERNAME=postgres
DB_PASSWORD=sermaluc
JWT_SECRET=
PASSWORD_REGEX=sermaluc
MAX_FILE_SIZE=5242880

##   Comandos de Desarrollo y Despliegue

```bash
npm run start:dev: Compila los archivos TypeScript a JavaScript y activa la función de "watch" para recargar los cambios en tiempo real.
npm run build: Crea la compilación para cargar en producción.
npm run test: Ejecuta las pruebas del proyecto (si las hubiera).

Dependencias
Dependencias Principales
@nestjs/*: Proporciona las herramientas y funciones principales para el funcionamiento del proyecto.
bcrypt: Librería para el hashing de contraseñas.
class-transformer: Librería para validación en DTOs y entidades.
class-validator: Librería para validación en DTOs y entidades.
dotenv: Carga las variables de entorno desde un archivo .env.
pg: Cliente de PostgreSQL para Node.js.
typeorm: ORM para interactuar con bases de datos.
uuid: Librería para generar UUIDs.
Dependencias de Desarrollo
@types/*: Definiciones de tipo de TypeScript para las librerías.
eslint: Linter para asegurar buenas prácticas de programación.
prettier: Formateador de código para trabajar con ESLint.
jest: Framework de testing para la implementación de pruebas unitarias.
Comandos de Instalación
Asegúrate de tener Node.js instalado.
Instala NestJS globalmente (npm install -g @nestjs/cli).
Clona el repositorio.
Ejecuta npm install para instalar las dependencias.
Configura las variables de entorno en el archivo .env.
Para la base de datos, instala Docker con la imagen de PostgreSQL o instala y configura PGAdmin.
