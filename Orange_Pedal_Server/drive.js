//Express
var express = require('express');
var app = express();
var ip = require("ip");
  
  app.use(express.static('public'));

  app.get('/key', function(req, res){
    res.sendfile('public/steer.html');
  });

  app.get('/bf', function(req, res){
    res.sendfile('public/brakefailcontrol.html');
  });

  app.get('/gas', function(req, res){
    res.sendfile('public/gas.html');
  });

  app.get('/brake', function(req, res){
    res.sendfile('public/brake.html');
  });

  app.get('/view', function(req, res){
    res.sendfile('public/view.html');
  });

  //Http Server
  var httpServer = require('http').Server(app);
  httpServer.listen(5000, function(){
    console.log(' ');
    console.log('-- port open @ 5000 --');
  });

//For Web Clients
var io_http = require('socket.io')(httpServer);
var io_unity = require('socket.io')({ transports: ['websocket'], });

  io_unity.attach(3000);

//-- Cache Data --//
var driveData = {
  gasVal : 0,
  brakeVal : 0,
  steerVal : 0,
  gearVal : [],
  brakefailVal: false,
}


var unitySocket;
var unityConnection = false;

var steerSocket;
var steerConnection = false;

var ipAddress = ip.address();

  io_http.on('connection', function(socket){

    if( socket.handshake.headers.referer == "http://" + ipAddress + ":5000/key" || socket.handshake.query.role == "key"){
      steerConnection = true
      steerSocket = socket;
      console.log("-- steer has connected --");
    }else if(socket.handshake.headers.referer == "http://" + ipAddress + ":5000/gas" || socket.handshake.query.role == "gas"){
      console.log("-- gas has connected --");
    }
    else if(socket.handshake.headers.referer == "http://" + ipAddress + ":5000/brake" || socket.handshake.query.role == "brake"){
      console.log("-- brake has connected --");
    }       

    socket.on('view', function(msg){
      //console.log("display Connected");
    });

    socket.on('steer', function(msg){
      driveData.steerVal = msg[0];
      driveData.gearVal[0] = msg[1];
      driveData.gearVal[1] = msg[2];

      if(unityConnection == true){
        SendToUnity();
      }
    });  

  //-------------gas---------------//
    socket.on('gas', function(msg){
      io_http.emit('gas', msg);

      if( msg[0] < -0.697 && msg[0] > -0.93){ //crop the range
      	driveData.gasVal =  1-((0.9 + msg[0]) / 0.25);
      }else if(msg[0] <= -0.697){
        driveData.gasVal = 1;
      }
      else{
      	driveData.gasVal = 0;
      }
      //console.log(driveData.gasVal);

    });

  //------------brake--------------//
    socket.on('brake', function(msg){
      io_http.emit('brake', msg);

      //console.log(msg);

      if( msg[0] < -0.373 && msg[0] > -0.723){ //crop the range
      	driveData.brakeVal =  (0.721 + msg[0]) / 0.36;
        driveData.brakeVal = Number(driveData.brakeVal.toPrecision(4));
      }else if(msg[0] >= -0.723){
        driveData.brakeVal = 1;
      }
      else{
      	driveData.brakeVal = 0;
      }
      //console.log(driveData.brakeVal);

    });

    //------------brakefail----------//
    socket.on('brakefail', function(msg){

      io_http.emit('brake', msg);

      if(msg == false){
        driveData.brakefailVal = 0;
      }
      else if(msg == true){
        driveData.brakefailVal = 1;
      }

    });

    socket.on('disconnect',function(){
      if( socket.handshake.headers.referer == "http://" + ipAddress + ":5000/key" || socket.handshake.query.role == "key"){
        steerConnection = false;
        steerSocket = null;
        console.log("-- steer has disconnected --");
        resetDriveData();
      }
    })

  });

  io_unity.on('connection', function(socket){
  	unityConnection = true
    console.log("unity connected")
  	unitySocket = socket;

  	socket.on('beep', function(){
  		socket.emit('boop', driveData );
    });

    socket.on('tach', function(msg){
        SendToSteerDis(msg);
    }); 

    socket.on("disconnect",function(){
      console.log("lost untiy game");
      resetDriveData();
    })

  });

function SendToUnity(){
  if(unityConnection){
	   unitySocket.emit('boop', driveData );
  }
}

function SendToSteerDis(tach){
  if(steerConnection){
    steerSocket.emit( 'tachBack' , tach );
  }
}

function startGameInput(){
  setInterval(function(){
      SendToUnity();
  },80);
}

function resetDriveData(){

  driveData = {
    gasVal : 0,
    brakeVal : 0,
    steerVal : 0,
    gearVal : [],
    brakefailVal: false,
  }

}










