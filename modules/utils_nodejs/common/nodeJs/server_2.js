var WebSocket = require("ws");
var WebSocketServer = WebSocket.Server;
var mysql = require('mysql');
var express = require('express'),
app = express();
const https = require('https');
const fs = require('fs');


const arg1 = require('minimist')(process.argv.slice(2));  // port
const arg2 = require('minimist')(process.argv.slice(3));  // env
const arg3 = require('minimist')(process.argv.slice(4));  // protocol
// site
console.log(arg3.protocol);
let server={ port: arg1.port };
if(arg3.protocol=="https"){

  httpsServer=https.createServer(
            {
            cert: fs.readFileSync('certificates/certificate.pem'),
            key: fs.readFileSync('certificates/key.pem'),    
            } 
                    );
        server={ server: httpsServer,port: arg1.port}
    
}

console.logger=function(message){
    if(arg2.env=="dev")
    {
          console.log(message);
    }else{
        return;
    }
        
};
var wss = new WebSocketServer( server );
var userid=null;
let rawdata = JSON.parse(fs.readFileSync("../../../../tmp/databases/site_theme30.json"));
var con = mysql.createConnection(rawdata);


// console.log("server started on "+process.argv[2]);
process.argv.forEach(function (val, index) {
 // console.log(index + ': ' + val);
});

con.connect(function(err) {
    
    if (err) throw err;
  //  console.log("Connected to mysql database!");    

});



var wsList = [];

wss.on('listening',function(){
  //  console.log('ok, server node is running ');
});

wss.on('connection', function(ws){
  //  console.log("WS connection server established!");
    wsList.push(ws);  
    
    ws.on('close', function(message){
        wsList.splice(wsList.indexOf(ws),1);
     //   console.log("WS server closed!");
       // console.log("Got ws server message: "+message);
         
      //  console.log("Close employee="+user.id+" type="+user.type  );
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
                var sql = "UPDATE t_employer_user SET is_online = 'N' WHERE id = '"+user.id+"'";
               //  console.log(sql);
                con.query(sql, function (err, result) {
                  if (err) throw err;                
                });      
         }
    });

    ws.on('message', function(message){
        
           // console.log("Got ws server message: "+message);
            for(var i=0;i<wsList.length;i++){
                // send to everybody on the site               
                if(wsList[i].readyState != wsList[0].OPEN){
                  //  console.error('Client state is ' + wsList[i].readyState);
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
             //   console.log(sql);
                con.query(sql, function (err, result) {
                  if (err) throw err;
                 // console.log(result.affectedRows + " record(s) updated");
                 });                    
            } 
            if(message.employer !== undefined )
            {
                user = { type: 'employer' , id : message.employer };                     
                var sql = "UPDATE t_employer_user SET is_online = 'Y' WHERE id = '"+user.id+"'";   
              //  console.log(sql);
                con.query(sql, function (err, result) {
                  if (err) throw err;
                //  console.log(result.affectedRows + " record(s) updated");
                 });                    
            } 
    });
    
});

wss.on('close',function(){    
  //  console.log('server is stopping!!');   
});



var express = require('express'),
    app = express();
    
app.use(express.static(__dirname + '/static'));
app.set('port',process.env.PORT||8888);
app.listen(8888/*app.get('port')*/);