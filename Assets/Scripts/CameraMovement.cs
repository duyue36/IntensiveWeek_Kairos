using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMovement : MonoBehaviour {
    public float amplitude;
    private float factor;
    private float xPosition;
	// Use this for initialization
	void Start () {
        xPosition = transform.localPosition.x;
	}
	// Update is called once per frame
	void Update () {
        factor = Mathf.Sin(Time.time/5);
        transform.localPosition = new Vector3(xPosition + factor * amplitude*0.1f, transform.localPosition.y, transform.localPosition.z);
	}
}
