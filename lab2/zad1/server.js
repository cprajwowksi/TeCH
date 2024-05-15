const http = require("http")

const server = http.createServer((req, res) => {

        res.statusCode = 200;
        res.setHeader('Content-type','text/plan');
      	res.end('Hello World')
});

server.listen(8080, "0.0.0.0", () => {
        console.log('Server running')
})
