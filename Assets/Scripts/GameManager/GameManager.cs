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
    void Awake()
    {
        Instance = this;
    }
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
