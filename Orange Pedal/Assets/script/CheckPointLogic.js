#pragma strict

private var FLCheckPoint : Vector3;
private var FRCheckPoint:Vector3;
private var BRCheckPoint:Vector3;
private var BLCheckPoint:Vector3;

var FLWheel:GameObject;
var FRWheel:GameObject;
var BRWheel:GameObject;
var BLWheel:GameObject;

var CurrentRenderer : Renderer;
var CurrentGameObject : GameObject;

var TargetMateriaDefault : Material;
var TargetMateriaFinish : Material;

var gotTarget:boolean = false;
var Audi_R8:GameObject; 
private var Audi_R8_Rigidbody : Rigidbody;

var DoSomethingTime : int = 0;
var speed : int = 0;

var parkingPos:Vector3;

function Start () {

	FLCheckPoint = transform.Find("checkPoint1").gameObject.transform.position;
	FRCheckPoint = transform.Find("checkPoint2").gameObject.transform.position;
	BRCheckPoint = transform.Find("checkPoint3").gameObject.transform.position;
	BLCheckPoint = transform.Find("checkPoint4").gameObject.transform.position;
	CurrentRenderer = transform.GetComponent.<Renderer>();
	Audi_R8_Rigidbody = Audi_R8.GetComponent.<Rigidbody>();
	parkingPos = transform.position;

}

function Update () {

	speed = transform.InverseTransformDirection(Audi_R8_Rigidbody.velocity).z;

	if( Vector3.Distance(FLWheel.transform.position, FLCheckPoint) + 
			   Vector3.Distance(FRWheel.transform.position, FRCheckPoint) + 
			   Vector3.Distance(BRWheel.transform.position, BRCheckPoint) + 
			   Vector3.Distance(BLWheel.transform.position, BLCheckPoint)
			   <5
	){

		if(speed == 0){
			CurrentRenderer.material = TargetMateriaFinish;
			if(gotTarget == false ){
				gotTarget = true;
				Audi_R8.SendMessage("updateParkingCount", gotTarget);
				Audi_R8.SendMessage("updateLastParkingSite", parkingPos);
				//Debug.Log(parkingPos.x + " " + parkingPos.y + " " + parkingPos.z);
				StartCoroutine("DoSomething");
			}
		}


	}
	else{
		CurrentRenderer.material = TargetMateriaDefault;
	}

}

function DoSomething(){
	while (DoSomethingTime <= 2) {
		if(DoSomethingTime == 2){
			DoSomethingTime++;
			print("DoSomething_stop");
			Destroy(transform.gameObject);
		}
	    DoSomethingTime++;
	    print("DoSomething_Loop");
	    yield WaitForSeconds (2);
	 }
}