using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

[System.Serializable]
public struct SingleItem
{
    public GameObject Item_Object;
    public Image Item_Image;
    //public Text Item_Text;
}

public class MouseClick : MonoBehaviour{
    public SingleItem[] Items;
    public Text Item_discribe_text;

    //public SingleItem Item_0;
    //public SingleItem Item_1;

    /*
    public GameObject Item_0;
    public Image Item_0_Image;
    public Image NarrativePanel;
    public Text Item_0_Text;
    */
    
    public float delay = 0.5f;  //this is how long in seconds to allow for a double click

    private Item item;
    bool one_click;
    bool timer_running;
    float timer_for_double_click;


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
                    if (hit.collider.transform.parent.tag == "Item")
                    {
                        DescribeObject(hit.collider.gameObject.tag);
                    }
                }
            }
            else
            {
                one_click = false; // found a double click, now reset
                //Debug.Log("it's a double click");
                //do double click things
                if (Physics.Raycast(ray, out hit, 100))
                {
                    if(hit.collider.transform.parent.tag == "Item")
                    {
                        hit.collider.gameObject.SetActive(false);  // hide the Item object in the scene.
                        PickUpItem(hit.collider.gameObject.tag);
                        Debug.Log("pickup tag = " + hit.collider.gameObject.tag);
                    }


                    //if it's inventroy image, make the image invisible and return the object
                    Debug.Log("what hit now is " + hit.collider);
                    if(hit.collider.transform.parent.tag == "Item_UI")
                    {
                        Debug.Log(" hit the ui ");
                        PutBackItem(hit.collider.gameObject.tag);
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

    void PickUpItem(string ItemTag)
    {
        if (ItemTag == "Item_Coin")
        {
            Items[0].Item_Image.GetComponent<Image>().enabled = true;
        }
        if (ItemTag == "Item_Coffee")
        {
            Items[1].Item_Image.GetComponent<Image>().enabled = true;
        }

        //Inventory.Instance.AddItem(item);
        //Item_0.Item_Image.GetComponent<Image>().enabled = true;
        //Item_0_Image.gameObject.SetActive(true);

        //hide the narrative panel
        // NarrativePanel.gameObject.SetActive(false);
        Item_discribe_text.text = "";
    }
    public void PutBackItem_0()
    {
        if(GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[0].Item_Object.SetActive(true);
            Items[0].Item_Image.GetComponent<Image>().enabled = false;
        }
        
    }

    public void PutBackItem_1()
    {
        if (GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[1].Item_Object.SetActive(true);
            Items[1].Item_Image.GetComponent<Image>().enabled = false;
        }
    }

    public void PutBackItem(string ItemTag)
    {
        
        for(int i = 0; i < Items.Length; i++)
        {
            if (Items[i].Item_Image.tag == ItemTag)
            {
                Items[i].Item_Object.SetActive(true);
                Items[i].Item_Image.gameObject.SetActive(false);
            }
        }
        
    }

    void DescribeObject(string ItemTag)
    {
        //NarrativePanel.GetComponent<Image>().enabled = true;

        // NarrativePanel.gameObject.SetActive(true);
        if (ItemTag == "Item_Coin")
        {
            Item_discribe_text.text = "It's Grandma's favourite coin";
        }
        if (ItemTag == "Item_Coffee")
        {
            Item_discribe_text.text = "Grandma hates Coffee";
        }
        
        //Item_0.Item_Text.gameObject.SetActive(true);
    }

   
}
