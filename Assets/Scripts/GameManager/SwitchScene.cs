using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SwitchScene : MonoBehaviour {
    public Button switchButton;
    private GameObject narrativePanel;  //It's the blur panel to discribe Text
    // Use this for initialization
    void Start () {
        Button switchBtn = switchButton.GetComponent<Button>();

        switchBtn.onClick.AddListener(SwitchToBossRoom);
        
        narrativePanel = GameObject.Find("Persistent Parts/NarrativeCanvas/Panel");

    }

    void SwitchToBossRoom()
    {
        if(gameObject.tag == "Phase_0")
        {
            if (narrativePanel != null)
                narrativePanel.gameObject.SetActive(false); // if chance scene, make it disactive
            SceneManager.LoadScene("Phase_1_Investigation");
        }

        if(gameObject.tag == "Phase_1")
        {
            if(narrativePanel != null)
            {
                narrativePanel.gameObject.SetActive(true);
            }
            
            SceneManager.LoadScene("Phase_0_BossFlight");
        }
        
    }
}
