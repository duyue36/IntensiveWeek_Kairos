using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SC_SmallHand : MonoBehaviour {

    Vector3 originalPosition;
    public Transform targetTransform;
    Vector3 targetPosition;
    bool isShowingHand;
    bool isHidingHand;
    float startTime;
    float t;
    public RawImage myImage;

    // Use this for initialization
    void Start () {
        originalPosition = GetComponent<Transform>().position;
        myImage = GetComponent<RawImage>();
        targetPosition = targetTransform.position;
	}
	
	// Update is called once per frame
	void Update ()
    {
        if (isShowingHand)
        {
            if (t < 1.0f)
            {
                t += Time.deltaTime / 3; // Sweeps from 0 to 1 in time seconds
                transform.position = Vector3.Lerp(originalPosition, targetPosition, t); // Set position proportional to t
            }
            else
            {
                t = 0;
                isShowingHand = false;
            }
        }

        if (isHidingHand)
        {
            if (t < 1.0f)
            {
                t += Time.deltaTime; // Sweeps from 0 to 1 in time seconds
                transform.position = Vector3.Lerp(targetPosition, originalPosition, t); // Set position proportional to t
            }
            else
            {
                t = 0;
                isHidingHand = false;
                if (!myImage.enabled)
                {
                    myImage.enabled = true;
                }
            }
        }
    }

    public void ShowHand()
    {
        startTime = Time.time;
        isShowingHand = true;
    }

    public void HideHand()
    {
        startTime = Time.time;
        isHidingHand = true;
    }
}
