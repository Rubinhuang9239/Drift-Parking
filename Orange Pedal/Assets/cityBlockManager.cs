using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cityBlockManager : MonoBehaviour {

	public GameObject currentBlock;
	public GameObject lastBlock;
	public GameObject nextBlock;

	public Transform R8Trans;

	Vector2[] extentedPos;

	//int predictExitDir; //0 Front//1 Right//2 Back//3 Left// 272.5 // 362.6

	// Use this for initialization
	void Start () {
		extentedPos = new Vector2[9];
		extentedPos [5] = new Vector2 (currentBlock.transform.position.x, currentBlock.transform.position.z);


		for (int i = 0; i < extentedPos.Length; i++) {
			print (extentedPos[i]);
		}

	}
	
	// Update is called once per frame
	void Update () {
		checkCurrentBlock ();
	}

	void checkCurrentBlock(){

		Vector2 currentPos = new Vector2 (R8Trans.position.x, R8Trans.position.z);

		float deltaX =  currentBlock.transform.position.x - currentPos.x;
		float deltaZ =  currentBlock.transform.position.z - currentPos.y;

		//if()
	
	}
}
