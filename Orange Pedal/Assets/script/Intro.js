#pragma strict

import UnityEngine.UI;

var mainCover:GameObject;
var introMainControlCover:GameObject;
var introTachCover:GameObject;
var title:GameObject;
var subtitle:GameObject;
var startSign:GameObject;
var mainControl:GameObject;
var shift:GameObject;

var titleRender:Text;
var subtitleRender:Text;
var startSignRender:Text;
var mainControlRender:Text;
var shiftRender:Text;

var mainCoverImage:Image;
var introMainControlImage:Image;
var introTachImage:Image;

var fadeoutMainCoverKey:boolean = false;
var getTachPageKey:boolean = false;
var readyForGameKey:boolean = false;

var introSqCount : int = 0;

function Start () {
mainCoverImage = mainCover.GetComponent.<Image>();
introMainControlImage = introMainControlCover.GetComponent.<Image>();
introTachImage = introTachCover.GetComponent.<Image>();


titleRender = title.GetComponent.<Text>();
subtitleRender = subtitle.GetComponent.<Text>();
startSignRender = startSign.GetComponent.<Text>();
mainControlRender = mainControl.GetComponent.<Text>();
shiftRender = shift.GetComponent.<Text>();
}

function Update () {

if (Input.GetKeyDown (KeyCode.Space))
		{
			Debug.Log("Skip");
			
			if(fadeoutMainCoverKey == false){
			StartCoroutine("introSq");
			}
			
			fadeoutMainCoverKey = true;
		}
		
fadeoutMainCover();
getTachPage();
readyForGame();

}

function fadeoutMainCover(){

if(fadeoutMainCoverKey == true && mainCoverImage.color.a>0){
mainCoverImage.color.a -= 0.02;
mainCover.transform.localScale.x += 0.02;
mainCover.transform.localScale.y += 0.01;

titleRender.color.a -= 0.02;
subtitleRender.color.a -= 0.02;
startSignRender.color.a -= 0.02;
mainControlRender.color.a += 0.02;
}



}

function getTachPage(){
if(getTachPageKey == true && introMainControlImage.color.a>0){
introMainControlImage.color.a -= 0.02;
mainControlRender.color.a -= 0.02;
shiftRender.color.a += 0.02;
}
}

function readyForGame(){
if(readyForGameKey == true && introTachImage.color.a>0){
introTachImage.color.a -= 0.02;
shiftRender.color.a -= 0.02;
}
}

function introSq(){

	while (introSqCount <= 3) {
		introSqCount ++;
		if(introSqCount == 2){
		fadeoutMainCoverKey=false;
		getTachPageKey = true;
		}
		else if(introSqCount == 3){
		getTachPageKey = false;
		readyForGameKey = true;
		}
		else if(introSqCount == 4){
		Application.LoadLevel(1) ;
		}
		
        yield WaitForSeconds (4);
    }

}
