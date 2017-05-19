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
                        DescribeObject(hit.collider.gameObject.tag);  // Describe the item in the scene

                        CameraControl.Instance.target = hit.transform;   //focus the camera on that Item
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

                    /*
                    //if it's inventroy image, make the image invisible and return the object
                    if(hit.collider.transform.parent.tag == "Item_UI")
                    {
                        Debug.Log(" hit the ui ");
                        PutBackItem(hit.collider.gameObject.tag);
                    }
                    */
              

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
        if (ItemTag == "Item_Collar")
        {
            Items[0].Item_Image.GetComponent<Image>().enabled = true;
            GameManager.Instance.CollarGot = true;
        }
        if (ItemTag == "Item_Letter")
        {
            Items[1].Item_Image.GetComponent<Image>().enabled = true;
            GameManager.Instance.LetterGot = true;
        }

        if (ItemTag == "Item_Key")
        {
            Items[2].Item_Image.GetComponent<Image>().enabled = true;
            GameManager.Instance.KeyGot = true;
        }

        if (ItemTag == "Item_Phone")
        {
            Items[3].Item_Image.GetComponent<Image>().enabled = true;
            GameManager.Instance.PhoneGot = true;
        }
        if (ItemTag == "Item_Photo")
        {
            Items[4].Item_Image.GetComponent<Image>().enabled = true;
            GameManager.Instance.PhotoGot = true;
        }
        if (ItemTag == "Item_Umbrella")
        {
            Items[5].Item_Image.GetComponent<Image>().enabled = true;
            GameManager.Instance.UmbrellaGot = true;
        }

        //Inventory.Instance.AddItem(item);
        //Item_0.Item_Image.GetComponent<Image>().enabled = true;
        //Item_0_Image.gameObject.SetActive(true);

        //hide the narrative panel
        // NarrativePanel.gameObject.SetActive(false);
        Item_discribe_text.text = "";  // To clear up the text in the scene
    }
    public void PutBackItem_0()
    {
        if(GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[0].Item_Object.SetActive(true);
            Items[0].Item_Image.GetComponent<Image>().enabled = false;
            GameManager.Instance.CollarGot = false;
        }
        
    }

    public void PutBackItem_1()
    {
        if (GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[1].Item_Object.SetActive(true);
            Items[1].Item_Image.GetComponent<Image>().enabled = false;
            GameManager.Instance.LetterGot = false;
        }
    }

    public void PutBackItem_2()
    {
        if (GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[2].Item_Object.SetActive(true);
            Items[2].Item_Image.GetComponent<Image>().enabled = false;
            GameManager.Instance.KeyGot = false;
        }
    }

    public void PutBackItem_3()
    {
        if (GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[3].Item_Object.SetActive(true);
            Items[3].Item_Image.GetComponent<Image>().enabled = false;
            GameManager.Instance.PhoneGot = false;
        }
    }

    public void PutBackItem_4()
    {
        if (GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[4].Item_Object.SetActive(true);
            Items[4].Item_Image.GetComponent<Image>().enabled = false;
            GameManager.Instance.PhotoGot = false;
        }
    }

    public void PutBackItem_5()
    {
        if (GameObject.Find("GameManager").tag == "Phase_0")
        {
            Items[5].Item_Object.SetActive(true);
            Items[5].Item_Image.GetComponent<Image>().enabled = false;
            GameManager.Instance.UmbrellaGot = false;
        }
    }

    //PutbackItem function not used in the scene
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
        if(GameManager.Instance.English == true)
        {
            if (ItemTag == "Item_Coin")
            {
                Item_discribe_text.text = "It's Grandma's favourite coin";
            }
            if (ItemTag == "Item_Coffee")
            {
                Item_discribe_text.text = "Grandma hates Coffee";
            }

            if (ItemTag == "Item_Collar")
            {
                Item_discribe_text.text = "Choupinou's collar was not really usefull. The neighbor would need it for his bad dog!";
            }

            if (ItemTag == "Item_Letter")
            {
                Item_discribe_text.text = "No Letter from my childs since a long time. No one cares about me except for my inheritance. ";
            }
            if (ItemTag == "Item_Key")
            {
                Item_discribe_text.text = "If I always keep my keys with me, nobody can burgles me!";
            }
            if (ItemTag == "Item_Phone")
            {
                Item_discribe_text.text = "I've unplugged my phone since I'm convinced that peoples were using it to spy on me!";
            }
            if (ItemTag == "Item_Photo")
            {
                Item_discribe_text.text = "He has good maners, Choupinou... Not like all these agressive dogs we met today!";
            }

            if (ItemTag == "Item_Umbrella")
            {
                Item_discribe_text.text = "The neighbor's dog shredded my umbrella when I tried to defend myself ...";
            }
        }
        else   // if the language is French
        {
            if (ItemTag == "Item_Collar")
            {
                Item_discribe_text.text = "La laisse de Choupinou n’a pas beaucoup servi. Le voisin en aurait bien besoin pour son vilain chien !";
            }

            if (ItemTag == "Item_Letter")
            {
                Item_discribe_text.text = "Plus de courrier de mes enfants depuis longtemps. Je n’intéresse personne si ce n’est pour mon héritage...";
            }
            if (ItemTag == "Item_Key")
            {
                Item_discribe_text.text = "Si je garde mes clefs toujours proches de moi, personne ne peut venir me dévaliser !";
            }
            if (ItemTag == "Item_Phone")
            {
                Item_discribe_text.text = "J’ai débranché mon téléphone. Je suis persuadé qu’ils l’utilisent pour m’épier !";
            }
            if (ItemTag == "Item_Photo")
            {
                Item_discribe_text.text = "Il était sage Choupinou… Pas comme tous ces chiens agressifs que l’on voit aujourd’hui !";
            }

            if (ItemTag == "Item_Umbrella")
            {
                Item_discribe_text.text = "Le chien du voisin a déchiqueté mon parapluie quand j’ai voulu me défendre...";
            }
        }
        

        //Item_0.Item_Text.gameObject.SetActive(true);
    }

   
}
