const express = require('express');
const http = require('http');
const path = require('path');
const { createBareServer } = require('@tomphttp/bare-server-node');

const app = express();
const server = http.createServer();
const bare = createBareServer('/bare/');

app.use(express.static(path.join(__dirname, 'public')));

server.on('request', (req, res) => {
    if (bare.shouldRoute(req)) bare.routeRequest(req, res);
    else app(req, res);
});

server.on('upgrade', (req, socket, head) => {
    if (bare.shouldRoute(req)) bare.routeUpgrade(req, socket, head);
    else socket.end();
});

server.listen(process.env.PORT || 8080, () => console.log('Site Live: http://localhost:20000'));