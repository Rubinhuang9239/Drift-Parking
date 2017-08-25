#pragma strict
import UnityEngine.Audio;

var Audi_R8_Rigidbody : Rigidbody;
var R8 : GameObject;

var FRWheelMash : GameObject;
var FLWheelMash : GameObject;

var FRWheelMashOut : GameObject;
var FLWheelMashOut : GameObject;
var BRWheelMashOut : GameObject;
var BLWheelMashOut : GameObject;

var Brake_Tails:GameObject;

var FRWheel : WheelCollider;
var FLWheel : WheelCollider;

var BRWheel : WheelCollider;
var BLWheel : WheelCollider;

var LookingPoint : GameObject;

var socketObj : GameObject;

var trueTorque:int = 0;
var maxBrakeTorque:int = 400;

var gasVal:float = 0;
var brakeVal:float = 0;
var steerVal:float = 0;
var gearName:int = 3;
var handBrake:boolean = false;
var smoothRpm : int = 0;

var checkPointCount:int = 0;
var DisplayStyle : GUIStyle;
var DisplayStyle2 : GUIStyle;
var DisplayStyleReset : GUIStyle;

var BrakeLights_on : GameObject;
var BrakeLights_off : GameObject;

var parkingPos:Vector3;

var EngineSound:GameObject;
var EngineSoundWave:AudioSource;

var CheckPointDis:String;
var timeLeft : float = 620;

var brakeFail:boolean = false;

function Start () {

GetComponent.<Rigidbody>().centerOfMass.y = 0;

socketObj = GameObject.Find("TestSocket");
R8 = GameObject.Find("Audi_R8");

Audi_R8_Rigidbody = R8.GetComponent.<Rigidbody>();
EngineSoundWave = EngineSound.GetComponent.<AudioSource>();

}

function FixedUpdate () {


//-------Steer------//
//

// FRWheelMash.transform.Rotate(Vector3.up*-10 * steerVal);

//----------------//
//steerVal = -1*Input.GetAxis("Horizontal");
//----------------//
 
 FLWheelMash.transform.localRotation.y = Mathf.PI*( - 0.125 * steerVal ) ;
 FRWheelMash.transform.localRotation.y = Mathf.PI*( - 0.125 * steerVal ) ;
 
 FRWheel.steerAngle = -30 * steerVal;
 FLWheel.steerAngle = -30 * steerVal;
 
 var wheelRotationDis=Vector3.left*smoothRpm*25*Time.deltaTime;
 
 
if(smoothRpm <= 40){
EngineSoundWave.pitch = (0.3 + smoothRpm * 0.02);
EngineSoundWave.volume = (0.01 + smoothRpm * 0.005);
}
else if(smoothRpm > 40 && smoothRpm <= 65){
EngineSoundWave.pitch = (0.6 + smoothRpm * 0.007);
EngineSoundWave.volume = (0.02 + smoothRpm * 0.0037);
}
else if(smoothRpm > 65 && smoothRpm <= 100){
EngineSoundWave.pitch = (0.72 + smoothRpm * 0.005);
EngineSoundWave.volume = (0.04 + smoothRpm * 0.0025);
}
else if(smoothRpm > 100 && smoothRpm <= 135){
EngineSoundWave.pitch = (0.84 + smoothRpm * 0.002);
EngineSoundWave.volume = (0.08 + smoothRpm * 0.002);
}
else if(smoothRpm > 135 && smoothRpm <= 170){
EngineSoundWave.pitch = (0.9 + smoothRpm * 0.0015);
EngineSoundWave.volume = (0.14 + smoothRpm * 0.0015);
}
else if(smoothRpm > 170 && smoothRpm <= 205){
EngineSoundWave.pitch = (0.95 + smoothRpm * 0.001);
EngineSoundWave.volume = (0.2 + smoothRpm * 0.0012);
}
 
 FLWheelMashOut.transform.Rotate(wheelRotationDis);
 FRWheelMashOut.transform.Rotate(wheelRotationDis);
 BLWheelMashOut.transform.Rotate(wheelRotationDis);
 BRWheelMashOut.transform.Rotate(wheelRotationDis);
 
 
 //--------Brake-------//
 
  //----------------//
 //gasVal = 0.75;
 //trueTorque = 75;
 //----------------//

if(handBrake == false){
 //----------------//
 //brakeVal = Input.GetAxis("Vertical");
 //----------------//
if(brakeFail == false){
 FRWheel.brakeTorque = maxBrakeTorque * brakeVal;
 FLWheel.brakeTorque = maxBrakeTorque * brakeVal;
 BRWheel.brakeTorque = maxBrakeTorque * brakeVal;
 BLWheel.brakeTorque = maxBrakeTorque * brakeVal;
 }
 else{
 FRWheel.brakeTorque = 0;
 FLWheel.brakeTorque = 0;
 BRWheel.brakeTorque = 0;
 BLWheel.brakeTorque = 0;
 }
//
 }
 else{
 
 if(brakeFail == false){
 FRWheel.brakeTorque = maxBrakeTorque;
 FLWheel.brakeTorque = maxBrakeTorque;
 BRWheel.brakeTorque = maxBrakeTorque;
 BLWheel.brakeTorque = maxBrakeTorque;
 }
 else{
 FRWheel.brakeTorque = 0;
 FLWheel.brakeTorque = 0;
 BRWheel.brakeTorque = 0;
 BLWheel.brakeTorque = 0;
 }
 
 }
 
 
 if(FRWheel.brakeTorque > 40){
Brake_Tails.active = true;
BrakeLights_on.active = true;
BrakeLights_off.active = false;
 //----------------//
// trueTorque = 0;
 //----------------//

 }else{
 
 Brake_Tails.active = false;
BrakeLights_on.active = false;
BrakeLights_off.active = true;
 
 //----------------//
 if(brakeFail == true ){
  gasVal = 1;
 }
 //----------------//

 }
 
 
 //--------Gas--------//
 //Debug.Log(gasVal);
 //Debug.Log(trueTorque * gasVal);
 
 FRWheel.motorTorque = trueTorque * gasVal;
 FLWheel.motorTorque = trueTorque * gasVal;
 BRWheel.motorTorque = trueTorque * gasVal;
 BLWheel.motorTorque = trueTorque * gasVal;
 
 smoothRpm = 10 * transform.InverseTransformDirection(Audi_R8_Rigidbody.velocity).z;
 socketObj.SendMessage("tachFeedback", smoothRpm);
 
 //-------Timmer----//
 if(timeLeft > 0){
 timeLeft = (620-Time.time);
 }
 else if( timeLeft <= 0){
 timeLeft = 0;
 }
}


function updateGasPedalPos(gasPos:float){
	gasVal = gasPos;
	//Debug.Log(gasPos);
}

function updateBrakePedalPos(brakePos:float){

	brakeVal = brakePos;
}

function updateSteerPos(steerPos:float){

	steerVal = steerPos;
}

var getTorque:boolean = true;

function updateGearPos(gear_Name:int){
	
	gearName = gear_Name;
	handBrake = false;
	LookingPoint.transform.localRotation.y = 0;
	
	if(gearName == 2 || gearName == 3){
	trueTorque = 0;
	getTorque=false;
	if(gearName == 3){
	handBrake = true;
	}
	}
	
	else if(gearName == 4){
	trueTorque = -45;
	LookingPoint.transform.localRotation.y = Mathf.PI * 3.14;
	}
	
	else{
	getTorque = true;
	}
	
}

function updateTorquePos(true_Torque:int){
	if(getTorque == true){
 	trueTorque = true_Torque;
 	}
}

function updateParkingCount(e:boolean){
checkPointCount++;
}

function updateLastParkingSite(e:Vector3){
parkingPos = e;
}

function updateBrakeFailPos(e:int){



if(e == 0){
brakeFail = false;
}
else if(e == 1){
brakeFail = true;
}

}



