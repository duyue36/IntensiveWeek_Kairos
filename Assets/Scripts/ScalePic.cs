using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScalePic : MonoBehaviour {

	public AnimationCurve scaleCurve;
	public float scaleFactor;
	private float maxScale;

	// Use this for initialization
	void Start () {
		maxScale = transform.localScale.z;

	}
	
	// Update is called once per frame
	void Update () {
		scaleFactor = Mathf.Abs(Mathf.Sin (Time.time));
		transform.localScale = new Vector3 (transform.localScale.x, transform.localScale.y, maxScale * scaleCurve.Evaluate(scaleFactor));
	}
}
