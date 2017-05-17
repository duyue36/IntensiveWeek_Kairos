using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MouseClick : MonoBehaviour{
    public GameObject Item_0;
    public Image Item_0_Image;
    public Image NarrativePanel;
    public Text Item_0_Text;
    
    public float delay = 0.5f;  //this is how long in seconds to allow for a double click

    private Item item;
    bool one_click;
    bool timer_running;
    float timer_for_double_click;

    void Awake()
    {
        Item_0_Image.gameObject.SetActive(false);
        NarrativePanel.gameObject.SetActive(false);
        Item_0_Text.gameObject.SetActive(false);
    }

    void Update()
    {
        ClickDetect();
    }

    void ClickDetect()  // Detect it's single click or double click
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

           
                if (!one_click) // It's first click without previous clicks
            {
                one_click = true;  //To tell that now player has clicked once

                timer_for_double_click = Time.time; // save the current time
                // do one click things;
                Debug.Log("it's a single click");

                if (Physics.Raycast(ray, out hit, 100))
                {
                    if (hit.collider.gameObject.tag == "Item")
                    {
                        DescribeObject();
                    }
                }
            }
            else
            {
                one_click = false; // found a double click, now reset
                Debug.Log("it's a double click");
                //do double click things
                if (Physics.Raycast(ray, out hit, 100))
                {
                    if(hit.collider.gameObject.tag == "Item")
                    {
                        PickUpItem();
                    }
                }
            }
        }
        if (one_click)
        {
            // if the time now is delay seconds more than when the first click started. 
            if ((Time.time - timer_for_double_click) > delay) //which means second click is too long, it's not double click, we should reset the detection 
            {
                one_click = false;

            }
        }
    }

    void PickUpItem()
    {
        Item_0.gameObject.SetActive(false);
        //Inventory.Instance.AddItem(item);
        Item_0_Image.gameObject.SetActive(true);

        //hide the narrative panel
        NarrativePanel.gameObject.SetActive(false);
        Item_0_Text.gameObject.SetActive(false);
    }

    void DescribeObject()
    {
        NarrativePanel.gameObject.SetActive(true);
        Item_0_Text.gameObject.SetActive(true);
    }
}
