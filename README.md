# Chat App

Aplicación de chat en tiempo real construida con Node.js, Express y Socket.IO.

## Funcionalidades
- Generación de nombre de usuario aleatorio al ingresar.
- Envío/recepción de mensajes en tiempo real.
- Cambio de nombre de usuario en cualquier momento.

## Runtime
- Versión mayor de Node.js requerida: `20` (ver `.nvmrc`).

## Inicio Rápido (Golden Path)

### Opción A: Local (npm)
1. Instala Node 20.
2. Ejecuta la configuración inicial:
   - macOS/Linux: `./setup.sh`
   - Windows (Git Bash): `./setup.sh`
   - Windows (PowerShell, equivalente manual):
     - `npm ci`
     - `if (!(Test-Path .env)) { Copy-Item .env.example .env }`
     - `npm run migrate --if-present`
     - `npm run seed --if-present`
   - Alternativa: `make setup` (si `make` está instalado)
3. Inicia el servidor de desarrollo: `npm run dev`
4. Abre: [http://localhost:3001](http://localhost:3001)

### Opción B: Docker
1. Ejecuta: `docker compose up --build`
2. Abre: [http://localhost:3001](http://localhost:3001)

## Comandos Comunes
- `npm run dev`: inicia con recarga en caliente (`node --watch`).
- `npm start`: inicia el servidor.
- `npm test`: ejecuta prueba de humo contra `/health`.
- `make setup`: instala dependencias + bootstrap de entorno + migraciones + seed.

## Cómo Usar la App
1. Abre la app en dos ventanas/pestañas distintas del navegador para probar el chat en tiempo real.
2. Escribe un mensaje y haz clic en el botón con el ícono de avión de papel.
3. Para cambiar tu nombre de usuario, escribe en **Change name...** y haz clic en el botón con ícono de usuario.
4. Usa el panel derecho para confirmar tu nombre actual y el ID de sesión.

## Notas para Windows
- No uses `npm install nodemon -g`; este proyecto no requiere `nodemon`.
- Si `make` no está disponible, usa los comandos manuales de PowerShell de la sección de Inicio Rápido.
- Si la configuración local se bloquea por problemas de entorno, usa Docker (`docker compose up --build`).

## Estructura del Proyecto
- `server.js`: servidor Express + Socket.IO.
- `public/`: frontend estático.
- `scripts/smoke-test.js`: prueba de humo automatizada.
- `setup.sh`: script de bootstrap de configuración.
- `Makefile`: flujo de configuración con `make`.
- `docker-compose.yml` / `Dockerfile`: ruta de ejecución en contenedores.

## Fuentes
- [Documentación de Express](https://expressjs.com/)
- [Documentación de Socket.IO](https://socket.io/docs/v2/)
