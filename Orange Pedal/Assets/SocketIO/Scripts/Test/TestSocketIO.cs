#region License
/*
 * TestSocketIO.cs
 *
 * The MIT License
 *
 * Copyright (c) 2014 Fabio Panettieri
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#endregion

using System.Collections;
using UnityEngine;
using SocketIO;
	
public class TestSocketIO : MonoBehaviour
{
	public SocketIOComponent socket;
	public GameObject Audi_R8;

	public void Start() 
	{ 
		GameObject go = GameObject.Find("SocketIO");
		socket = go.GetComponent<SocketIOComponent>();

		socket.On("open", TestOpen);
		socket.On("boop", TestBoop);
		socket.On("error", TestError);
		socket.On("close", TestClose);
		
		StartCoroutine("BeepBoop");

		Audi_R8 = GameObject.Find("Audi_R8");
	}

	private IEnumerator BeepBoop()
	{
		// wait 1 seconds and continue
		yield return new WaitForSeconds(1);
		
		socket.Emit("beep");
		
		// wait 3 seconds and continue
		yield return new WaitForSeconds(3);
		
		socket.Emit("beep");
		
		// wait 2 seconds and continue
		yield return new WaitForSeconds(2);
		
		socket.Emit("beep");
		
		// wait ONE FRAME and continue
		yield return null;
		
		socket.Emit("beep");
		socket.Emit("beep");
	}

	public void TestOpen(SocketIOEvent e)
	{
		Debug.Log("[SocketIO] Open received: " + e.name + " " + e.data);
	}
	
	public void TestBoop(SocketIOEvent e)
	{

		JSONObject gasValObject = e.data["gasVal"];
		float gasVal = float.Parse(gasValObject.ToString());
		//Audi_R8.SendMessage("updateGasPedalPos", gasVal);
		print (gasVal);


		JSONObject brakeValObject = e.data["brakeVal"];
		float brakeVal = float.Parse(brakeValObject.ToString());
		Audi_R8.SendMessage("updateBrakePedalPos", brakeVal);


		JSONObject steerValObject = e.data["steerVal"];
		float steerVal = float.Parse(steerValObject.ToString());
		Audi_R8.SendMessage("updateSteerPos", steerVal);


		JSONObject gearValObject = e.data["gearVal"];
		int gearVal = int.Parse(gearValObject[0].ToString());
		int torqueVal = int.Parse(gearValObject[1].ToString());
		Audi_R8.SendMessage("updateGearPos", gearVal);
		Audi_R8.SendMessage("updateTorquePos", torqueVal);


		JSONObject brakeFailValObject = e.data["brakefailVal"];
		float brakeFailVal = int.Parse(brakeFailValObject.ToString());
		Audi_R8.SendMessage("updateBrakeFailPos", brakeFailVal);

	}

	public void tachFeedback( int tach ){
		socket.Emit("tach", new JSONObject(tach));
	}
	
	public void TestError(SocketIOEvent e)
	{
		Debug.Log("[SocketIO] Error received: " + e.name + " " + e.data);
	}
	
	public void TestClose(SocketIOEvent e)
	{	
		Debug.Log("[SocketIO] Close received: " + e.name + " " + e.data);
	}
}
