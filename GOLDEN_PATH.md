# GOLDEN_PATH

## Artefactos Creados
- `Makefile` con `make setup` (instala dependencias, bootstrap de entorno y ejecución de hooks de migración/seed).
- `setup.sh` para validaciones de runtime + instalación de dependencias + bootstrap de entorno.
- `.env.example` documentando variables de entorno requeridas.
- `.nvmrc` fijando la versión mayor de Node.
- `docker-compose.yml` + `Dockerfile` para levantar el proyecto con un solo comando (`docker compose up`).
- Ajustes de soporte en `package.json`, `server.js`, `public/js/chat.js` y `README.md`.

## Cobertura de Puntos de Dolor

| Punto de Dolor # | Punto de Dolor | Artefacto que lo corrige | Estado |
|---|---|---|---|
| 1 | No se especifica la versión de Node | `.nvmrc`, `setup.sh`, `Dockerfile` | Corregido (Fixed) |
| 2 | El README asume conocimiento de `nodemon` | `README.md` y `package.json`: se eliminó el requisito de `nodemon` y se usa `node --watch` | Corregido (Fixed) |
| 3 | Falla `npm install nodemon -g` por permisos | `README.md` y `package.json`: no se requiere instalación global | Corregido (Fixed) |
| 4 | `nodemon` no se reconoce en PATH (Windows) | Se eliminó por completo el requisito de `nodemon` (`node --watch`) | Corregido (Fixed) |
| 5 | No existe `.env` de referencia | `.env.example`, `setup.sh`, `Makefile` (bootstrap automático de `.env`) | Corregido (Fixed) |
| 6 | README no explica qué hacer si el puerto está ocupado | `README.md` aún no incluye procedimiento explícito de resolución de conflicto de puerto | Parcial (Partial) |
| 7 | No hay comando/documentación de pruebas | `scripts/smoke-test.js`, `npm test`, `README.md` actualizado | Corregido (Fixed) |
| 8 | UX poco clara (cambio de nombre y prueba en dos ventanas) | `README.md` actualizado en “Cómo Usar la App” | Corregido (Fixed) |
| 9 | README centrado en Unix, sin guía para Windows | `README.md` actualizado en “Notas para Windows” + ruta con Docker | Corregido (Fixed) |
| 10 | Dependencias desactualizadas en repositorio antiguo | No se ejecutó una estrategia de upgrade mayor (Express/Socket.IO) en esta iteración | Fuera de alcance (Out of Scope) |

## Registro de Prompts de IA

### Prompt 1
"Usando este PAIN_LOG como contexto, genera un golden path para una app Node + Express + Socket.IO. Prioriza la confiabilidad del onboarding en Windows, elimina la dependencia de nodemon global e incluye al menos dos artefactos de setup de esta lista: Makefile, setup.sh, .env.example, .nvmrc, docker-compose.yml."

### Prompt 2
"Crea un `setup.sh` que valide la versión de Node desde `.nvmrc`, instale dependencias con errores claros, haga bootstrap de `.env`, y ejecute migraciones/seed solo si existen."

### Prompt 3
"Redacta `GOLDEN_PATH.md` con: lista de artefactos, tabla de mapeo de pain points (Fixed/Partial/Out of Scope), y una sección llamada 'What the AI Got Wrong' con correcciones manuales concretas."

## What the AI Got Wrong (Lo que la IA hizo mal)
1. Inicialmente propuso un flujo con instalación global de `nodemon`. Se eliminó `nodemon` por completo y se cambió el modo desarrollo a `node --watch` (Node 20), removiendo problemas de permisos/PATH.
2. Asumió que existía una base de datos real y propuso comandos estrictos de migración/seed que fallaban. Se reemplazaron por scripts no-op explícitos (`scripts/noop-task.js`) para mantener el setup estable y conservar los hooks.
3. Mantenía una URL de socket hardcodeada (`http://localhost:3001`), frágil en contenedores o proxys. Se corrigió a `io()` para conectar contra el host actual automáticamente.

## Notas
- Este repositorio no tiene base de datos persistente; por eso migración/seed son no-op intencionales.
- Los artefactos ya están creados en este repositorio; commit/push al fork queda como siguiente paso.
