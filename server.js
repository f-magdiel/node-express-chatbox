const express = require('express');
const path = require('path');
const socket = require('socket.io');
const PORT = Number(process.env.PORT) || 3001;

function createApp() {
    const app = express();

    // App
    app.use(express.static('public'))

    // Routes
    app.get('/', (request, response) => {
        response.sendFile(path.join(__dirname, 'public/index.html'))
    })

    app.get('/health', (_request, response) => {
        response.status(200).json({ ok: true });
    })

    return app;
}

function startServer(port = PORT) {
    const app = createApp();
    const server = app.listen(port, ()=>console.log(`Listening to requests on port ${port}`))

    // Listens for client connections
    const io = socket(server);

    // Handle incoming signals and emit
    io.on('connection', (socket) => {

        // Broadcast system message once a user has established connection
        io.sockets.emit('system', { name: 'System', id :socket.id})

        // Listen for chat-message from client, broadcast to everyone once received
        socket.on('chat-message', (data) => {
            io.sockets.emit('chat-message', data)
        })

        // Listen for name-change from client, broadcast to everyone once received
        socket.on('name-change', (data) => {
            io.sockets.emit('name-change', data)
        })
    })

    return server;
}

if (require.main === module) {
    startServer();
}

module.exports = { createApp, startServer };
