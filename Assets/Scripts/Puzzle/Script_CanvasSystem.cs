using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Script_CanvasSystem : MonoBehaviour
{
	public bool dragging;
	public GameObject imageBeingDragged;

	public DragHandler[] images;

	public int numberOfCorrectlyPlacedImages;

    public List<DragHandler> outerRing = new List<DragHandler>();
    public List<DragHandler> middleRing = new List<DragHandler>();
    public List<DragHandler> innerRing = new List<DragHandler>();

    // -------------------------- Added by Isabelle -------------------------- //
    public bool puzzleWon;
    public RawImage puzzleSolvedBlocker;
    int tempX;
    int tempY;
    int xShuffle;
    int yShuffle;
    /*int xShuffleWith;
    int yShuffleWith;*/
    DragHandler tileToShuffle;
    DragHandler tileToShuffleWith;
    Vector3 tempPosShuffle;
	public SC_HandsManager handManagerReference;
	public Script_MainCanvas buttonCanvasScript;

    void Start()
	{
        foreach (DragHandler item in images)
        {
            item.canvasSystem = this;
            tempX = item.correctCoordX;
            tempY = item.correctCoordY;
            if (tempX == 0 || tempX == 5 || tempY == 0 || tempY == 5)   // if the chosen tile is from the outter ring
            {
                outerRing.Add(item);
                item.fromOuterRing = true;
            } else if (!(tempX == 0 || tempX == 5 || tempY == 0 || tempY == 5) && !((tempX == 2 && (tempY == 2 || tempY == 3)) || (tempX == 3 && (tempY == 2 || tempY == 3))))
            {
                middleRing.Add(item);
                item.fromMiddleRing = true;
            }
            else
            {
                innerRing.Add(item);
                item.fromInnerRing = true;
            }
        }

        StartCoroutine(WaitStart());
    }

	void Update()
	{
        if (!puzzleWon)
        {
            numberOfCorrectlyPlacedImages = 0;

            foreach (DragHandler image in images) //Check if there is an image under the dragged image
            {

                if (image.correctlyPlaced == true)
                {
                    numberOfCorrectlyPlacedImages++;
                }

                if (numberOfCorrectlyPlacedImages == images.Length)
                {
                    //THINGS HAPPENING WHEN WINNING
                    puzzleWon = true;
                    MoveInHierarchy(100); //Put in front of everything in the UI
					puzzleSolvedBlocker.enabled = true;
					handManagerReference.StopHands ();
					buttonCanvasScript.HideImageButton ();
                }
            }
        }

        //////////////////////////////////////////////////////////////////////////////////////
        if (GameManager.Instance.CollarGot)
        {
            AddMissingPiece(1);
        }
        if (GameManager.Instance.KeyGot)
        {
            AddMissingPiece(2);
        }
        if (GameManager.Instance.PhoneGot)
        {
            AddMissingPiece(3);
        }
        ///////////////////////////////////////////////////////////////////////////////////////////

	}

    //FUNCTION TO MOVE IN HIERARCHY (in order to control the rendering order)
    public void MoveInHierarchy(int delta)
    {
        int index = puzzleSolvedBlocker.transform.GetSiblingIndex();
        puzzleSolvedBlocker.transform.SetSiblingIndex(index + delta);
    }

    // -------------------------- Added by Isabelle -------------------------- //
    public void AddMissingPiece(int newPiece)   // Called when the player gets one of the missing piece of this puzzle. 1 for the outer ring - 2 for the middle ring - 3 for the inner ring
    {
        foreach (DragHandler image in images)
        {
            tempX = image.correctCoordX;
            tempY = image.correctCoordY;
            switch (newPiece)
            {
                case 1:
                    if (tempX == 0 || tempX == 5 || tempY == 0 || tempY == 5)
                    {
                        image.GetComponent<DragHandler>().Unlocked();
                    }
                    break;
                case 2:
                    if (!(tempX == 0 || tempX == 5 || tempY == 0 || tempY == 5) && !((tempX == 2 && (tempY == 2 || tempY == 3)) || (tempX == 3 && (tempY == 2 || tempY == 3))))
                    {
                        image.GetComponent<DragHandler>().Unlocked();
                    }
                    break;
                case 3:
                    if ((tempX == 2 && (tempY == 2 || tempY == 3)) || (tempX == 3 && (tempY == 2 || tempY == 3)))
                    {
                        image.GetComponent<DragHandler>().Unlocked();
                    }
                    break;
                default:
                    break;
            }
        }
    }

    public void HandShuffleTiles()
    {
        tileToShuffle = images[Random.Range(0, images.Length)];
        tileToShuffleWith = tileToShuffle;
        if (tileToShuffle.fromOuterRing)
        {
            while (tileToShuffleWith == tileToShuffle)
            {
                tileToShuffleWith = outerRing[Random.Range(0, outerRing.Count)];
            }
        }
        if (tileToShuffle.fromMiddleRing)
        {
            while (tileToShuffleWith == tileToShuffle)
            {
                tileToShuffleWith = middleRing[Random.Range(0, middleRing.Count)];
            }
        }
        if (tileToShuffle.fromInnerRing)
        {
            while (tileToShuffleWith == tileToShuffle)
            {
                tileToShuffleWith = innerRing[Random.Range(0, innerRing.Count)];
            }
        }

        tempPosShuffle = tileToShuffle.myRectTransform.localPosition;
        tileToShuffle.myRectTransform.localPosition = tileToShuffleWith.myRectTransform.localPosition;
        tileToShuffleWith.myRectTransform.localPosition = tempPosShuffle;
        tileToShuffleWith.ActualizeCoord();
        tileToShuffle.ActualizeCoord();
    }

    IEnumerator WaitStart()
    {
        yield return new WaitForSeconds(.01f);

        foreach (DragHandler item in outerRing)
        {
            tileToShuffle = outerRing[Random.Range(0, outerRing.Count)];
            tileToShuffleWith = outerRing[Random.Range(0, outerRing.Count)];

            tempPosShuffle = tileToShuffle.myRectTransform.localPosition;
            tileToShuffle.myRectTransform.localPosition = tileToShuffleWith.myRectTransform.localPosition;
            tileToShuffleWith.myRectTransform.localPosition = tempPosShuffle;
        }

        foreach (DragHandler item in middleRing)
        {
            tileToShuffle = middleRing[Random.Range(0, middleRing.Count)];
            tileToShuffleWith = middleRing[Random.Range(0, middleRing.Count)];

            tempPosShuffle = tileToShuffle.myRectTransform.localPosition;
            tileToShuffle.myRectTransform.localPosition = tileToShuffleWith.myRectTransform.localPosition;
            tileToShuffleWith.myRectTransform.localPosition = tempPosShuffle;
        }

        foreach (DragHandler item in innerRing)
        {
            tileToShuffle = innerRing[Random.Range(0, innerRing.Count)];
            tileToShuffleWith = innerRing[Random.Range(0, innerRing.Count)];

            tempPosShuffle = tileToShuffle.myRectTransform.localPosition;
            tileToShuffle.myRectTransform.localPosition = tileToShuffleWith.myRectTransform.localPosition;
            tileToShuffleWith.myRectTransform.localPosition = tempPosShuffle;
        }

        foreach (DragHandler item in images)
        {
            item.ActualizeCoord();
        }
    }
}
