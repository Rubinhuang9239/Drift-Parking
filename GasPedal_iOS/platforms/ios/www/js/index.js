var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
    	ui.init();
    	// setTimeout(function(){
    	// 	videoCapturePlusDemo(true,true,0);
    	// },4000);
    },
};


var socket = io("http://192.168.77.2:5000?role=gas");
      var gasPos = new Array();
      var stableVal={
            y : 0,
            rotate : null,
          }

var ui = {};

    ui.capture = false;

    ui.init = function(){

        // window.addEventListener('devicemotion',function(event){
        //   var acceleration = event.accelerationIncludingGravity;
        //   tilt = acceleration.z/9.8;
        //   stableVal.y += ( tilt * (window.innerHeight/3) -stableVal.y ) * 0.2;
        //   stableVal.rotate += ( tilt - stableVal.rotate) * 0.2;
        // });

        navigator.accelerometer.watchAcceleration(accSuccess, accError, {frequency: 40 });

        function accSuccess(acceleration){
        	var tilt = acceleration.z/-9.8;
        	stableVal.y += ( tilt * (window.innerHeight/3) -stableVal.y ) * 0.2;
            stableVal.rotate += ( tilt - stableVal.rotate) * 0.2;
            stableVal.rotate = Number(stableVal.rotate.toPrecision(4));
        }

        function accError() {
		    console.warn("motion detection error!");
		}

        var captureBtn = document.getElementById("captureBtn");
        captureBtn.addEventListener("click",function(){
          //start capture//
          ui.capture = true;
          //call codova function here//
          videoCapturePlusDemo(true,true,0);
        });

        sendGasPos();
      }

      function sendGasPos(){

        gasPos[0] = stableVal.rotate;
        if(stableVal.rotate){
          socket.emit('gas',gasPos);
          if(ui.capture == false){
            back.style.transform = "translateY(" + Math.round( (window.innerHeight / 6)  + stableVal.y) + "px)";
          }
        }
        setTimeout(function(){sendGasPos();},50);

      }


