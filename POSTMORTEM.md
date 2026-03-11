## What Was Broken

El repositorio original carecía de especificaciones básicas (versión de Node.js, variables de entorno) y su documentación asumía conocimientos previos de herramientas como nodemon, así como un entorno Unix. Esto provocaba que un nuevo hire con Windows enfrentara errores de permisos, comandos no reconocidos y fallos silenciosos en los primeros 25 minutos, sin poder verificar si la app funcionaba correctamente. Además, las dependencias estaban desactualizadas (7 años sin mantenimiento), añadiendo riesgos de seguridad y compatibilidad.

## What We Built (Lo que construimos)

- `Makefile` con `make setup`: estandariza la preparación local (instalación de dependencias, bootstrap de `.env`, hooks de migración/seed) y elimina pasos manuales inconsistentes.
- `setup.sh`: valida prerequisitos (Node/npm), falla con mensajes claros y automatiza la configuración inicial para reducir errores de onboarding.
- `.env.example`: documenta variables requeridas y elimina ambigüedad sobre configuración de entorno.
- `.nvmrc`: fija versión mayor de Node y evita incompatibilidades por versiones distintas entre máquinas.
- `docker-compose.yml` + `Dockerfile`: habilitan un flujo de arranque reproducible con `docker compose up` y reducen diferencias entre entornos.
- Actualizaciones en `README.md`: añaden guía de uso real de la app, pasos para Windows y comandos de verificación.
- `scripts/smoke-test.js` + `npm test`: introducen validación mínima ejecutable para confirmar estado funcional.
- Cambio en cliente Socket.IO (`io()` en vez de URL hardcodeada): evita fallos de conexión por host/puerto fijo en diferentes entornos.

## Cost of the Original State (Costo del estado original)

Estimación mensual:

`Costo mensual = Engineers/mes * Horas perdidas por engineer * Costo por hora`

Con el escenario solicitado:

- Engineers/mes: `5`
- Horas perdidas por engineer: `X`
- Costo por hora: `$Y`

Resultado:

`Costo mensual = 5 * X * Y`

Ejemplo usando el bloqueo observado en el pain log (`~25 min = 0.42 h`):

`Costo mensual = 5 * 0.42 * Y = 2.1 * Y`

Si `$Y = $60/h`, entonces:

`Costo mensual ≈ $126 USD/mes`

## What We Would Do Next
La mejora de mayor ROI que no alcanzamos a implementar es la persistencia de los chats en una base de datos, ya que actualmente los mensajes desaparecen al cerrar la ventana y los usuarios no pueden retomar conversaciones anteriores. Implementar almacenamiento (con MongoDB, PostgreSQL o SQLite) permitiría recuperar el historial al volver a conectarse, habilitaría búsqueda de mensajes antiguos y sentaría las bases para funcionalidades como autenticación de usuarios o salas persistentes, transformando la app de una demo técnica a un producto realmente útil para usuarios finales.

## The Demo

[Demo](https://drive.google.com/file/d/1fTAY3pdsuKhfYVL_t3N9104dOhWmOZU6/view?usp=sharing
)