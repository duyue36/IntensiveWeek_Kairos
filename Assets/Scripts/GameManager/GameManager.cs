using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour {
    public static GameManager Instance   //make Inventory a singleton 
    {
        get; private set;
    }

    public bool English;
    public bool Français;

    [HideInInspector]
    public bool CollarGot;
    [HideInInspector]
    public bool LetterGot;
    [HideInInspector]
    public bool KeyGot;
    [HideInInspector]
    public bool PhoneGot;
    [HideInInspector]
    public bool PhotoGot;
    [HideInInspector]
    public bool UmbrellaGot;


    void Awake()
    {
        Instance = this;
    }

    /*
    void Update()
    {

    }
    */
}
