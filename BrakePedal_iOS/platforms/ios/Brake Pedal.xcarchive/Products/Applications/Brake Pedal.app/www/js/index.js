var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
    	ui.init();
    	setTimeout(function(){
    		videoCapturePlusDemo(true,true,0);
    	},14000);
    },
};


var socket = io("http://192.168.77.2:5000?role=brake");
      var brakePos = new Array();
      var stableVal={
          x : 0,
          rotate : null,
        }

var ui = {};

    ui.init = function(){

        // window.addEventListener('devicemotion',function(event){
        //   var acceleration = event.accelerationIncludingGravity;
        //   tilt = acceleration.z/9.8;
        //   stableVal.y += ( tilt * (window.innerHeight/3) -stableVal.y ) * 0.2;
        //   stableVal.rotate += ( tilt - stableVal.rotate) * 0.2;
        // });

        navigator.accelerometer.watchAcceleration(accSuccess, accError, {frequency: 50 });

        function accSuccess(acceleration){
            var tilt = acceleration.x/-9.8;
            stableVal.x += ( tilt * (window.innerHeight/3) -stableVal.x ) * 0.2;
            stableVal.rotate += ( tilt - stableVal.rotate) * 0.2;
            stableVal.rotate = Number(stableVal.rotate.toPrecision(4));
        }

        function accError() {
		    console.warn("motion detection error!");
		}

        sendBrakePos();
      }

      function sendBrakePos(){

          brakePos[0] = stableVal.rotate;
          if(stableVal.rotate){
            socket.emit('brake',brakePos);
            back.style.transform = "translateY(" + Math.round( (window.innerHeight / 6)  + stableVal.x) + "px)";
          }
          setTimeout(function(){sendBrakePos();},50);

        }


