using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Script_MainCanvas : MonoBehaviour {

	public Canvas puzzleMazeCanvas;
	public Canvas puzzleImageCanvas;

	public GameObject imageButton;
	public GameObject mazeButton;

	public SC_HandsManager handManager;

	void Start()
	{
		//puzzleMazeCanvas = GameObject.Find ("Puzzle_Canvas").GetComponent<Canvas> ();
		//puzzleImageCanvas = GameObject.Find ("Puzzle_Canvas2").GetComponent<Canvas> ();
	}

	public void HideMazeButton(){
		mazeButton.SetActive (false);
	}

	public void HideImageButton(){
		imageButton.SetActive (false);
	}

	public void StartMazePuzzle()
	{
		if (!puzzleMazeCanvas.enabled) {
			puzzleMazeCanvas.enabled = true;
			handManager.StartHands ();
			this.gameObject.GetComponent<Canvas> ().enabled = false;
		} else {
			puzzleMazeCanvas.enabled = false;
		}
	}

	public void StartImagePuzzle()
	{
		if (!puzzleImageCanvas.enabled) {
			puzzleImageCanvas.enabled = true;
			handManager.StartHands ();
			this.gameObject.GetComponent<Canvas> ().enabled = false;
		} else {
			puzzleImageCanvas.enabled = false;
		}
	}

	public void BackToPrevious()
	{
		if (!this.gameObject.GetComponent<Canvas> ().enabled) {
			if (puzzleMazeCanvas.enabled) {
				puzzleMazeCanvas.enabled = false;
			}
			if (puzzleImageCanvas.enabled) {
				puzzleImageCanvas.enabled = false;
			}
			this.gameObject.GetComponent<Canvas> ().enabled = true;
			handManager.StopHands ();
		} else {
			//Go to previous scene
		}
	}
}
