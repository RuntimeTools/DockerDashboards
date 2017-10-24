require('appmetrics-dash').attach()

const http = require('http');

module.exports = http.createServer((req, res) => {
    // Send "Hello World!" to every request
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end("Hello World!");
}).listen(3000, () => console.log("Node.js HTTP server listening on port 3000"));
