using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class Script_CanvasSystem : MonoBehaviour
{
	public bool dragging;
	public GameObject imageBeingDragged;

	public GameObject[] images;

	public int numberOfCorrectlyPlacedImages;

	void Start()
	{
		images = GameObject.FindGameObjectsWithTag ("Ui_Image");
	}

	void Update()
	{
		numberOfCorrectlyPlacedImages = 0;

		foreach (GameObject image in images) //Check if there is an image under the dragged image
		{
			var imageDragHandler = image.GetComponent<DragHandler>();

			if (imageDragHandler.correctlyPlaced == true)
			{
				numberOfCorrectlyPlacedImages++;
			}

			if (numberOfCorrectlyPlacedImages == images.Length)
			{
				//THINGS HAPPENING WHEN WINNING
				print("You won!");
			}
		}
	}

}
