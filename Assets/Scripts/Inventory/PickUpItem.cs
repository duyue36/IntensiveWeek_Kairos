using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickUpItem : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        DetectDoubleClick();
    }

    void DetectDoubleClick()
    {
        bool one_click = false;
        bool timer_running;
        float timer_for_double_click = 0;

    //this is how long in seconds to allow for a double click
        float delay = 0.5f;
        if (Input.GetMouseButtonDown(0))
        {
            if (!one_click) // first click no previous clicks
            {
                one_click = true;

                timer_for_double_click = Time.time; // save the current time
                // do one click things;
                Debug.Log("it's a single click, timer_for_double_click = " + timer_for_double_click);
            }
            else
            {
                one_click = false; // found a double click, now reset
                Debug.Log("it's a double click");
                //do double click things
            }
        }
        if (one_click)
        {
            // if the time now is delay seconds more than when the first click started. 
            if ((Time.time - timer_for_double_click) > delay)
            {

                //basically if thats true its been too long and we want to reset so the next click is simply a single click and not a double click.
                one_click = false;

            }
        }
    }
}
