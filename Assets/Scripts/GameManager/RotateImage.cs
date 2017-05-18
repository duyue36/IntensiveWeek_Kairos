using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RotateImage : MonoBehaviour {
    public Image backPhase_0_button;

    Vector3 rotateAngle;
	// Use this for initialization
	void Start () {
        rotateAngle = new Vector3(0, 180, 0);
        backPhase_0_button.transform.Rotate(rotateAngle);

    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
