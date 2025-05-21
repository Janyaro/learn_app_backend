const http = require('http');
http.createServer((req,res)=>{
res.write('we will create our own server on the node js ');
res.end();
}).listen(3000);