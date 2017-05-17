using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SwitchScene : MonoBehaviour {
    public Button switchButton;
    // Use this for initialization
    void Start () {
        Button switchBtn = switchButton.GetComponent<Button>();

        switchBtn.onClick.AddListener(SwitchToBossRoom);
    }

    void SwitchToBossRoom()
    {
        if(gameObject.tag == "Phase_0")
        {
            SceneManager.LoadScene("Phase_1_BossRoom");
        }

        if(gameObject.tag == "Phase_1")
        {
            SceneManager.LoadScene("Phase_0_Investigation");
        }
        
    }
}
