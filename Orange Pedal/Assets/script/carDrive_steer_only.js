#pragma strict
import UnityEngine.Audio;

private var Audi_R8_Rigidbody : Rigidbody;
var R8 : GameObject;

var steerWheelTrans : Transform; 

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

private var trueTorque:int = 0;
private var maxBrakeTorque:int = 200;

private var gasVal:float = 0;
private var brakeVal:float = 0;
private var steerVal:float = 0;
private var gearName:int = 3;
private var handBrake:boolean = false;
private var smoothRpm : int = 0;

private var checkPointCount : int = 0;

var BrakeOnMat : Material;
var BrakeOffMat : Material;

var BrakeLightsRend : Renderer;

private var parkingPos:Vector3;

var EngineSound:GameObject;
var EngineSoundWave:AudioSource;

private var timeLeft : float = 620.0;

private var brakeFail:boolean = false;

private var getTorque : boolean = true;

//-----GUI------//

var checkPointsRemain : Text;
var timeRemain : Text;

function Start () {
	Application.runInBackground = true;

	GetComponent.<Rigidbody>().centerOfMass.y = 0;

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
	 
	 FRWheel.steerAngle = -35 * steerVal;
	 FLWheel.steerAngle = -35 * steerVal;

	 steerWheelTrans.localEulerAngles.x = 100 * steerVal;
	 
	 var wheelRotationDis=Vector3.left*smoothRpm*25*Time.deltaTime;
	 
	 
	if(smoothRpm <= 40){
		EngineSoundWave.pitch = (0.3 + smoothRpm * 0.01);
		EngineSoundWave.volume = (0.05 + smoothRpm * 0.005);
	}
	else if(smoothRpm > 40 && smoothRpm <= 65){
		EngineSoundWave.pitch = (0.6 + smoothRpm * 0.005);
		EngineSoundWave.volume = (0.09 + smoothRpm * 0.0037);
	}
	else if(smoothRpm > 65 && smoothRpm <= 100){
		EngineSoundWave.pitch = (0.72 + smoothRpm * 0.002);
		EngineSoundWave.volume = (0.12 + smoothRpm * 0.0025);
	}
	else if(smoothRpm > 100 && smoothRpm <= 135){
		EngineSoundWave.pitch = (0.84 + smoothRpm * 0.0012);
		EngineSoundWave.volume = (0.16 + smoothRpm * 0.002);
	}
	else if(smoothRpm > 135 && smoothRpm <= 170){
		EngineSoundWave.pitch = (0.9 + smoothRpm * 0.0008);
		EngineSoundWave.volume = (0.22 + smoothRpm * 0.0015);
	}
	else if(smoothRpm > 170 && smoothRpm <= 205){
		EngineSoundWave.pitch = (0.95 + smoothRpm * 0.0006);
		EngineSoundWave.volume = (0.3 + smoothRpm * 0.0012);
	}
	 
	 FLWheelMashOut.transform.Rotate(wheelRotationDis);
	 FRWheelMashOut.transform.Rotate(wheelRotationDis);
	 BLWheelMashOut.transform.Rotate(wheelRotationDis);
	 BRWheelMashOut.transform.Rotate(wheelRotationDis);
	 
	 
	 //--------Brake-------//
	 
	  //----------------//
	 //gasVal = 0.85;
	 //----------------//

	if(handBrake == false){
	 //----------------//
	 //brakeVal = 0;
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

	 //print(FRWheel.brakeTorque);
	 
	 if(FRWheel.brakeTorque > 40){
		Brake_Tails.active = true;
		BrakeLightsRend.material = BrakeOnMat;
	 //----------------//
		// trueTorque = 0;
	 //----------------//

	 }else{
	 
	 	Brake_Tails.active = false;
		BrakeLightsRend.material = BrakeOffMat;
	 
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
	 
	 smoothRpm = 7 * transform.InverseTransformDirection(Audi_R8_Rigidbody.velocity).z;
	 socketObj.SendMessage("tachFeedback", smoothRpm);
 
	//-------Timmer----//
	if(timeLeft > 0){
 		timeLeft = (620-Time.time);
 	}
 	else if( timeLeft <= 0){
 		timeLeft = 0;
	}

	//--------GUI--------//

	var min : int = Mathf.Floor(timeLeft/60);
	var sec : int = Mathf.Floor(timeLeft%60);
	var secString : String = "";
	var minString : String = "";

	if(min < 10){
		minString = "0" + min.ToString();
	}else{
		minString = min.ToString();
	}

	if(sec < 10){
		secString = "0" + sec.ToString();
	}else{
		secString = sec.ToString();
	}

	 timeRemain.text = "Time " + minString + ":" + secString;
	 checkPointsRemain.text = checkPointCount + " / 10";
}
	

function updateGasPedalPos(gasPos:float){
	gasVal = gasPos;
}

function updateBrakePedalPos(brakePos:float){

	brakeVal = brakePos;
}

function updateSteerPos(steerPos:float){

	steerVal = steerPos;
}

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



