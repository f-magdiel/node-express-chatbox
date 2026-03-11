[IMPLICIT_DEP] No especifica qué versión de Node.js usar. El new hire instala con su versión actual y puede fallar después por incompatibilidad.

[MISSING_DOC] El README asume que el usuario sabe qué es nodemon. Un new hire sin experiencia no sabe para qué sirve ni por qué necesita instalarlo globalmente.

[BROKEN_CMD] El comando npm install nodemon -g falla por permisos. En Windows necesita terminal como administrador, pero el README no lo aclara. El new hire se queda en este paso (25 minutos).

[BROKEN_CMD] Después de instalar nodemon, el comando nodemon server.js falla porque en Windows a veces el PATH no se actualiza y no reconoce el comando. El README no lo menciona.

[ENV_GAP] No hay archivo de variables de entorno (.env). Si la app necesitara configurar puertos o credenciales, el new hire no tendría referencia de qué variables usar.

[MISSING_DOC] El README no dice qué hacer si el puerto 3000 ya está siendo usado. Si el new hire tiene otro servicio corriendo, el servidor falla al iniciar y no sabe cómo solucionarlo.

[MISSING_DOC] La sección "Tests" solo dice que ellos probaron, pero no explica cómo ejecutar las pruebas. El new hire no puede verificar que todo funciona.

[MISSING_DOC] La app no es intuitiva. El new hire logra ver la interfaz pero:

- No sabe cómo cambiar el nombre de usuario (la opción no es obvia).
- El README no explica que necesita dos ventanas/navegadores para probar el chat en tiempo real.

[MISSING_DOC] README pensado para Unix, pero nosotros usamos Windows. Faltan instrucciones específicas para Windows (permisos, PATH, rutas), lo que causó problemas adicionales.

[IMPLICIT_DEP] Las dependencias del package.json están desactualizadas. El repositorio tiene 7 años y librerías como Express o socket.io pueden tener cambios importantes que afecten el funcionamiento o la seguridad.

Total de friction points: 10 .
Tiempo hasta bloqueo: ~25 minutos (new hire sin experiencia en Node, usando Windows)
