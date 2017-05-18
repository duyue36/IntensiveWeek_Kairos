using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Script_CanvasSystem_Maze : MonoBehaviour
{
	public bool dragging;
	public GameObject imageBeingDragged;

	public GameObject[] images;

	public int numberOfCorrectlyPlacedImages;

	public GameObject startingTile;


	//--------------------------------------//
	public bool puzzleWon;
	public GameObject puzzleSolvedBlocker;
	private RawImage puzzleSolvedBlockerImage;
	public SC_HandsManager handManagerReference;

	private int xShuffle;
	private int yShuffle;
	private bool handShufflingTileChosen;

	public Script_MainCanvas buttonCanvasScript;

	void Awake ()
	{
		images = GameObject.FindGameObjectsWithTag ("Ui_Image");

		puzzleSolvedBlockerImage = puzzleSolvedBlocker.GetComponent<RawImage> ();

		foreach (GameObject image in images) {
			image.GetComponent<MazeTile_Script> ().Initialize ();
		}
	}

	void Update ()
	{
		if (!puzzleWon) {
			numberOfCorrectlyPlacedImages = 0;

			foreach (GameObject image in images) { //Check if there is an image under the dragged image
				var imageDragHandler = image.GetComponent<MazeTile_Script> ();

				if (imageDragHandler.linkedToStart == true) {
					if (imageDragHandler.shouldHaveOnlyOneLink == false) {
						if (imageDragHandler.linkedTiles.Count == 2) {
							numberOfCorrectlyPlacedImages++;
						}
					} else {
						numberOfCorrectlyPlacedImages++;
					}
				}

				if (numberOfCorrectlyPlacedImages == images.Length) {
					//THINGS HAPPENING WHEN WINNING
					MoveInHierarchy (100); //Put in front of everything in the UI
					puzzleWon = true;
					puzzleSolvedBlockerImage.enabled = true;
					handManagerReference.StopHands ();
					buttonCanvasScript.HideMazeButton ();
				}
			}
		}
	}

	//FUNCTION TO MOVE IN HIERARCHY (in order to control the rendering order)
	public void MoveInHierarchy (int delta)
	{
		int index = puzzleSolvedBlocker.transform.GetSiblingIndex ();
		puzzleSolvedBlocker.transform.SetSiblingIndex (index + delta);
	}

	public void HandShuffleTiles(){
		handShufflingTileChosen = false;

		//SHUFFLING ONLY ONE TILE
		
		while (handShufflingTileChosen == false) {
			xShuffle = Random.Range (0, 5);
			yShuffle = Random.Range (0, 5);

			foreach (GameObject image in images) { //Check if there is an image under the dragged image
				var imageDragHandler = image.GetComponent<MazeTile_Script> ();

				if (imageDragHandler.currentCoordX == xShuffle && imageDragHandler.currentCoordY == yShuffle) {
					if (!imageDragHandler.movable) {
						break;
					} else {
						imageDragHandler.ShuffleTile ();
						handShufflingTileChosen = true;
					}
				}
			}
		}


        //SHUFFLING ALL THE TILES
        /*
        foreach (GameObject image in images) {
			var imageDragHandler = image.GetComponent<MazeTile_Script> ();

			if (imageDragHandler.movable) {
				imageDragHandler.ShuffleTile ();
			}
		}
        */
	}
}
