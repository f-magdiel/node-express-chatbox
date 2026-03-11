[IMPLICIT_DEP] No especifica qué versión de Node.js usar. El new hire instala con su versión actual y puede fallar después por incompatibilidad.

[BROKEN_CMD] El comando npm install nodemon -g falla por permisos. En Windows necesita terminal como administrador, pero el README no lo aclara. El new hire se queda en este paso (25 minutos).

[BROKEN_CMD] Después de instalar nodemon, el comando nodemon server.js falla porque en Windows a veces el PATH no se actualiza y no reconoce el comando. El README no lo menciona.

[MISSING_DOC] La sección "Tests" solo dice que ellos probaron, pero no explica cómo ejecutar las pruebas. El new hire no puede verificar que todo funciona.

[MISSING_DOC] La app no es intuitiva. El new hire logra ver la interfaz pero:

- No sabe cómo cambiar el nombre de usuario (la opción no es obvia).
- El README no explica que necesita dos ventanas/navegadores para probar el chat en tiempo real ni cómo usar las funciones básicas.

Total de friction points: 5
Tiempo hasta bloqueo: ~25 minutos (new hire sin experiencia en Node)
