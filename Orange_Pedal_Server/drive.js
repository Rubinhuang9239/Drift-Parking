var app = require('express')();
var express = require('express');
var http = require('http').Server(app);
var io_http = require('socket.io')(http);

var io_unity = require('socket.io')({
	transports: ['websocket'],
});



http.listen(5000, function(){
  console.log(' ');
  console.log('-- port open infor 小鲜橙在 *:5000 等你啦 --');
});

var Handlegas = false;
var Handlebrake = false;

var gasID;
var brakeID;

var gasVal = 0, brakeVal = 0, steerVal = 0;
var gearVal = [];

var brakefailVal = false;

app.use(express.static('pedals'));

//var PedalList = new Array();
//var DeviceCount = 0;

//------------------ FOOTPEDAL--------------------------//
//               ||                     //
//               ||                    //
//               ||               ----------
//         -------------         |          |
//        |   -------   |        |   |   |  |
//        |   -------   |        |   |   |  |
//        |    BRAKE    |        |ACCELERATE|
//        |   -------   |        |   |   |  |
//        \-------------/        |   |   |  |
//                               |   |   |  |
//                               |          |
//                               \----------/
//   ----------------------------------------------------

//-----------------------END-----------------------------//

var unitySocket;
var unityConnection = false;

var steerSocket;
var steerConnection = false;

app.get('/key', function(req, res){
  res.sendfile('steer.html');
});

app.get('/bf', function(req, res){
  res.sendfile('/brakefailcontrol.html');
});

app.get('/', function(req, res){

  if(Handlegas == false && Handlebrake == false){
  Handlegas = true;
  res.sendfile('gas.html');
  // res.sendfile('gas.jpg');
  }
  else if(Handlegas == true && Handlebrake == false){
  Handlebrake = true;
  res.sendfile('brake.html');
  }
  else if(Handlegas == false && Handlebrake == true){
  Handlegas = true;
  res.sendfile('gas.html');
  }
  else if(Handlegas == true && Handlebrake == true){
  return false;
  }
});

app.get('/view', function(req, res){
  res.sendfile('view.html');
});


io_http.on('connection', function(socket){
  steerConnection = true
  steerSocket = socket;

  socket.on('view', function(msg){
    //console.log("display Connected");
  });

  socket.on('steer', function(msg){
    steerVal = msg[0];
    gearVal[0] = msg[1];
    gearVal[1] = msg[2];
    if(unityConnection == true){
    SendToUnity();
  }
  });  

//-------------gas---------------//
  socket.on('gas', function(msg){
    io_http.emit('gas', msg);
    gasID = socket.id;
    //console.log(socket.id);
    //console.log(msg[0]);
    if( msg[0] < -0.695 && msg[0] > -0.93){ 
    	gasVal =  1-((0.9 + msg[0]) / 0.2);
      //console.log(gasVal)
    	//console.log("gas_push", gasVal);
    }
    else{
    	gasVal = 0;
    	//console.log("gas_release", gasVal);
    }
    if(unityConnection == true){
    SendToUnity();
	}

  });

//------------brake--------------//
  socket.on('brake', function(msg){
    io_http.emit('brake', msg);
    // console.log(msg[0]);
    brakeID = socket.id;

     if( msg[0] < -0.37 && msg[0] > -0.721){ 
    	brakeVal =  (0.721 + msg[0]) / 0.35;
    	//console.log("gas_push", gasVal);
    }
    else{
    	brakeVal = 0;
    	//console.log("gas_release", gasVal);
    }
    if(unityConnection == true){
    SendToUnity();
	}

  });

  //------------brakefail----------//
    socket.on('brakefail', function(msg){
    io_http.emit('brake', msg);
    if(msg == false){
    brakefailVal = 0;
    }
    else if(msg == true){
    brakefailVal = 1;
    }
    //console.log(brakefailVal);
    if(unityConnection == true){
    SendToUnity();
    }

  });

  socket.on('disconnect', function(){
    if(socket.id == gasID){ Handlegas = false; console.log('GAS Pedal lost');}
    if(socket.id == brakeID){ Handlebrake = false; console.log('BRAKE Pedal lost');}
  });

});


io_unity.attach(3000);

io_unity.on('connection', function(socket){
	unityConnection = true
	unitySocket = socket;

	socket.on('beep', function(){
		socket.emit('boop',{gas:gasVal, brake:brakeVal, steer:steerVal, gear:gearVal, brakefail:brakefailVal});
});

  socket.on('tach', function(msg){
    if(steerConnection == true){
    SendToSteerDis(msg);
    }
  }); 

});

function SendToUnity(){
	unitySocket.emit('boop',{gas:gasVal, brake:brakeVal, steer:steerVal, gear:gearVal, brakefail:brakefailVal});
	//console.log(gasVal,brakeVal,steerVal);
}


function SendToSteerDis(tach){
  steerSocket.emit( 'tachBack' , tach );
}






