using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DemonControler : MonoBehaviour {

    public AnimationCurve curve;
    public float scale;
    public float rotator;

    public float rotationMultiplier;
    
    private float factor;
    private Vector3 scaleTransform;

	// Use this for initialization
	void Start () {
        scaleTransform = transform.localScale;
    }

    // Update is called once per frame
    void Update () {
        factor = Mathf.Abs(Mathf.Sin(Time.time/4));
        rotationMultiplier = Mathf.Sin(Time.time*2);
        transform.RotateAround(transform.forward, rotationMultiplier * rotator * 0.01f);
        transform.localScale = scaleTransform*curve.Evaluate(factor)*scale ;
            }
}
