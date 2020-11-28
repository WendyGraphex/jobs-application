var WebSocket = require("ws");
var WebSocketServer = WebSocket.Server;
var mysql = require('mysql');
const https = require('https');
const fs = require('fs');


const argv = (() => {
    const arguments = {};
    process.argv.slice(2).map( (element) => {
        const matches = element.match( '--([a-zA-Z0-9]+)=(.*)');
        if ( matches ){
            arguments[matches[1]] = matches[2]
                .replace(/^['"]/, '').replace(/['"]$/, '');
        }
    });
    return arguments;
})();
 
if(argv.protocol=="https"){

/*
 * 
 * SSLCertificateFile /etc/letsencrypt/live/graphex.ewebsolutionskech-dev.com/cert.pem
SSLCertificateKeyFile /etc/letsencrypt/live/graphex.ewebsolutionskech-dev.com/privkey.pem
SSLCertificateChainFile /etc/letsencrypt/live/graphex.ewebsolutionskech-dev.com/chain.pem

 * 
 */

httpsServer=https.createServer(
            {
	    ssl : true,
            port: argv.port,
            cert: fs.readFileSync('/etc/apache2/ssl/graphextech.pem'),
            key: fs.readFileSync('/etc/apache2/ssl/graphextech.key')
        //    cert: fs.readFileSync('/etc/letsencrypt/live/graphex.ewebsolutionskech-dev.com/cert.pem'),
        //    key: fs.readFileSync('/etc/letsencrypt/live/graphex.ewebsolutionskech-dev.com/privkey.pem'),    
            } 
        );     
}

httpsServer.listen(6969);

var wss = new WebSocketServer({ server: httpsServer });

var user= null;

if(argv.database === "undefined"){
    throw new Error('The database File doesn\'t existe. ');
}

let rawdata = JSON.parse(fs.readFileSync(__dirname+"/../../../../tmp/databases/"+argv.site+".json"));
console.log(rawdata);
var con = mysql.createConnection(rawdata);


console.log("server started on "+argv.port);


con.connect(function(err) {    
    if (err) throw err;
    console.log("Connected to mysql database!");    
});



var wsList = [];

wss.on('listening',function(){
    console.log('ok, server node is running ');
});

wss.on('connection', function(ws){
    console.log("WS connection server established!");
    wsList.push(ws);  
    
    ws.on('close', function(message){
        wsList.splice(wsList.indexOf(ws),1);
        console.log("WS server closed!");
        console.log("Got ws closing server message: "+message);
         
        console.log("Close employee="+user.id+" type="+user.type  );
        if(user!==null && user.type=='employee')
        {                              
                var sql = "UPDATE t_employee_user SET is_online = 'N' WHERE id = '"+user.id+"'";
              //   console.log(sql);
                con.query(sql, function (err, result) {
                  if (err) throw err;                
                });      
         }
         if(user!==null && user.type=='employer')
        {                              
                var sql = "UPDATE t_employee_user SET is_online = 'N' WHERE id = '"+user.id+"'";
                 console.log(sql);
                con.query(sql, function (err, result) {
                  if (err) throw err;                
                });   
         } 
    });

    ws.on('error', function (error) { 

    console.log("Error");
    });


    ws.on('message', function(message){
        
            console.log("Got ws server message: "+message);
            for(var i=0;i<wsList.length;i++){
                // send to everybody on the site               
                if(wsList[i].readyState != wsList[0].OPEN){
                    console.error('Client state is ' + wsList[i].readyState);
                }
                else{
                     wsList[i].send(message);
                }
            }
            message=JSON.parse(message);
            if(message.employee !== undefined)
            {
                user = { type: 'employee' , id : message.employee };                     
                var sql = "UPDATE t_employee_user SET is_online = 'Y' WHERE id = '"+user.id+"'";   
                console.log(sql);
                con.query(sql, function (err, result) {
                  if (err) throw err;
                  console.log(result.affectedRows + " record(s) updated");
                 });                    
            } 
            if(message.employer !== undefined )
            {
                user = { type: 'employer' , id : message.employer };                     
                var sql = "UPDATE t_employer_user SET is_online = 'Y' WHERE id = '"+user.id+"'";   
                console.log(sql);
                con.query(sql, function (err, result) {
                  if (err) throw err;
                  console.log(result.affectedRows + " record(s) updated");
                 });                    
            } 
    });
    
});

wss.on('close',function(){    
    console.log('server is stopping!!');   
});

 