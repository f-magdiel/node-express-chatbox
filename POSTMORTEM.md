## What Was Broken

El repositorio original carecía de especificaciones básicas (versión de Node.js, variables de entorno) y su documentación asumía conocimientos previos de herramientas como nodemon, así como un entorno Unix. Esto provocaba que un nuevo hire con Windows enfrentara errores de permisos, comandos no reconocidos y fallos silenciosos en los primeros 25 minutos, sin poder verificar si la app funcionaba correctamente. Además, las dependencias estaban desactualizadas (7 años sin mantenimiento), añadiendo riesgos de seguridad y compatibilidad.

## What We Would Do Next

La mejora de mayor ROI que no alcanzamos a implementar es la persistencia de los chats en una base de datos, ya que actualmente los mensajes desaparecen al cerrar la ventana y los usuarios no pueden retomar conversaciones anteriores. Implementar almacenamiento (con MongoDB, PostgreSQL o SQLite) permitiría recuperar el historial al volver a conectarse, habilitaría búsqueda de mensajes antiguos y sentaría las bases para funcionalidades como autenticación de usuarios o salas persistentes, transformando la app de una demo técnica a un producto realmente útil para usuarios finales.

## The Demo

[Demo](https://drive.google.com/file/d/1fTAY3pdsuKhfYVL_t3N9104dOhWmOZU6/view?usp=sharing
)