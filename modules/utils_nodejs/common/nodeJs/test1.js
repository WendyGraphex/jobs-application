var http = require('https');
const fs = require('fs');

http.createServer(
 {
            cert: fs.readFileSync('/etc/letsencrypt/live/graphex.ewebsolutionskech-dev.com/cert.pem'),
            key: fs.readFileSync('/etc/letsencrypt/live/graphex.ewebsolutionskech-dev.com/privkey.pem'),
            }
,
function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.write('Hello World!');
  res.end();
}).listen(6969);

