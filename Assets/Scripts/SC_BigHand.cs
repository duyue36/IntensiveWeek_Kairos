using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SC_BigHand : MonoBehaviour {

    Vector3 originalPosition;
    public Transform targetTransform;
    Vector3 targetPosition;
    Vector3 targetScale;
    bool isShowingHand;
    bool isHidingHand;
    bool isPressingHand;
    bool isReleasingHand;
    float t;
    RawImage myImage;

    public Script_CanvasSystem canvasReference;
    public Script_CanvasSystem_Maze canvasMazeReference;

    // Use this for initialization
    void Start ()
    {
        originalPosition = GetComponent<Transform>().position;
        targetPosition = targetTransform.position;
        targetScale = new Vector3(.85f,.85f,.85f);
    }
	
	// Update is called once per frame
	void Update () {
        if (isShowingHand)
        {
            if (t < 1.0f)
            {
                t += Time.deltaTime / 5; // Sweeps from 0 to 1 in time seconds
                transform.position = Vector3.Lerp(originalPosition, targetPosition, t); // Set position proportional to t
            }
            else
            {
                t = 0;
                isShowingHand = false;
                isPressingHand = true;
            }
        }

        if (isPressingHand)
        {
            if (t < 1.0f)
            {
                t += Time.deltaTime*10; // Sweeps from 0 to 1 in time seconds
                transform.localScale = Vector3.Lerp(Vector3.one, targetScale, t); // Set position proportional to t
            }
            else
            {
                t = 0;
                isPressingHand = false;
                isReleasingHand = true;
                if (canvasReference.GetComponent<Canvas>().enabled)
                {
                    canvasReference.HandShuffleTiles();
                }
                if (canvasMazeReference.GetComponent<Canvas>().enabled)
                {
                    canvasMazeReference.HandShuffleTiles();
                }
            }
        }

        if (isReleasingHand)
        {
            if (t < 1.0f)
            {
                t += Time.deltaTime*10; // Sweeps from 0 to 1 in time seconds
                transform.localScale = Vector3.Lerp(targetScale, Vector3.one, t); // Set position proportional to t
            }
            else
            {
                t = 0;
                isReleasingHand = false;
                isHidingHand = true;
            }
        }

        if (isHidingHand)
        {
            if (t < 1.0f)
            {
                t += Time.deltaTime / 5; // Sweeps from 0 to 1 in time seconds
                transform.position = Vector3.Lerp(targetPosition, originalPosition, t); // Set position proportional to t
            }
            else
            {
                t = 0;
                isHidingHand = false;
            }
        }
    }

    public void ShowHand()
    {
        isShowingHand = true;
    }

    public void HideHand()
    {
        if (isShowingHand || isPressingHand || isReleasingHand)
        {
            isShowingHand = false;
            isPressingHand = false;
            isReleasingHand = false;
            transform.localScale = Vector3.one;
            transform.localPosition = originalPosition;
        }
    }
}
