using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

//[RequireComponent(typeof(Image))]
public class MazeTile_Script : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{

	//LINK VALUES
	public bool linkUp;
	public bool linkDown;
	public bool linkLeft;
	public bool linkRight;

	public bool linkedToStart;
	public bool shouldHaveOnlyOneLink;

	//SURROUDING TILES/IMAGES
	public GameObject TileTop;
	public GameObject TileBottom;
	public GameObject TileLeft;
	public GameObject TileRight;

	public List<GameObject> linkedTiles;

	//COORDINATES VALUES
	public int currentCoordX;
	public int currentCoordY;

	private int tempCoordX;
	private int tempCoordY;

	//VISUAL FEEDBACK VALUES
	public Color defaultColor;
	public Color cursorOverColor;
	public Color draggedColor;

	//GAMEPLAY VALUES
	public bool movable;

	private bool otherImageDraggedOver;

	private bool returnToOriginalPos;

	private MazeTile_Script imageDragHandler;

	public bool startingTile;

	//SHUFFLING VALUES
	private int xShuffle;
	private int yShuffle;
	private GameObject tileToBeShuffledWith;
	public bool hasBeenSwitched;


	//DRAGGING VALUES
	public bool dragOnSurfaces = true;

	private GameObject m_DraggingIcon;
	private RectTransform m_DraggingPlane;

	private Vector2 originalPos;

	private Script_CanvasSystem_Maze canvasSystem;

	public bool cursorOver;

	private Vector2 originalSize;


	public void Initialize ()
	{
		canvasSystem = GameObject.Find ("Puzzle_Canvas").GetComponent<Script_CanvasSystem_Maze> ();
		returnToOriginalPos = true;
		originalSize = GetComponent<RectTransform> ().sizeDelta;

		//SHUFFLING THE TILES
		if (movable == true && hasBeenSwitched == false) {
			ShuffleTile ();
		}
	}


	//START DRAG
	public void OnBeginDrag (PointerEventData eventData)
	{
		var canvas = FindInParents<Canvas> (gameObject);
		if (canvas == null)
			return;
		// We have clicked something that can be dragged.

		if (movable == true) { // What we want to do is create an icon for this. This works only if the object is "movable"
			m_DraggingIcon = this.gameObject;

			//communicating dragging info to the canvas system
			canvasSystem.dragging = true;
			canvasSystem.imageBeingDragged = m_DraggingIcon;

			var image = m_DraggingIcon.GetComponent<Image> ();

			image.sprite = GetComponent<Image> ().sprite;
			image.SetNativeSize ();

			if (dragOnSurfaces)
				m_DraggingPlane = transform as RectTransform;
			else
				m_DraggingPlane = canvas.transform as RectTransform;

			originalPos = m_DraggingIcon.GetComponent<RectTransform> ().position;

			SetDraggedPosition (eventData);

			//Disable the raycast blocking, so that the image behind it can be detected
			GetComponent<CanvasGroup> ().blocksRaycasts = false;

			GetComponent<Image> ().color = draggedColor; //change the color to the dragged color
			MoveInHierarchy (100); //Put in front of everything in the UI
		}
	}


	//WHILE DRAGGING
	public void OnDrag (PointerEventData data)
	{
		if (m_DraggingIcon != null && movable == true) {
			SetDraggedPosition (data);
			GetComponent<Image> ().color = draggedColor; //change the color to the dragged color
		}
	}


	//FUNCTION TO SET POSITION WHILE DRAGGING
	private void SetDraggedPosition (PointerEventData data)
	{
		if (dragOnSurfaces && data.pointerEnter != null && data.pointerEnter.transform as RectTransform != null)
			m_DraggingPlane = data.pointerEnter.transform as RectTransform;

		var rt = m_DraggingIcon.GetComponent<RectTransform> ();
		Vector3 globalMousePos;
		if (RectTransformUtility.ScreenPointToWorldPointInRectangle (m_DraggingPlane, data.position, data.pressEventCamera, out globalMousePos)) {
			rt.position = globalMousePos;
			rt.rotation = m_DraggingPlane.rotation;
			rt.sizeDelta = originalSize;
		}
	}


	//END DRAG
	public void OnEndDrag (PointerEventData eventData)
	{
		var dragHandlerDragged = m_DraggingIcon.GetComponent<MazeTile_Script> ();

		foreach (GameObject image in canvasSystem.images) { //Check if there is an image under the dragged image
			var dragHandlerTested = image.GetComponent<MazeTile_Script> ();

			if (dragHandlerTested.otherImageDraggedOver == true && dragHandlerTested.movable == true) {
				//switch position and coordinates
				m_DraggingIcon.GetComponent<RectTransform> ().position = image.GetComponent<RectTransform> ().position;
				image.GetComponent<RectTransform> ().position = originalPos;
				returnToOriginalPos = false;

				tempCoordX = dragHandlerTested.currentCoordX;
				tempCoordY = dragHandlerTested.currentCoordY;

				dragHandlerTested.currentCoordX = dragHandlerDragged.currentCoordX;
				dragHandlerTested.currentCoordY = dragHandlerDragged.currentCoordY;
				dragHandlerDragged.currentCoordX = tempCoordX;
				dragHandlerDragged.currentCoordY = tempCoordY;

				break;
			}
		}

		if (returnToOriginalPos == true) { //If the image has not been dragged over another movable image, then it comes back to its original position
			m_DraggingIcon.GetComponent<RectTransform> ().position = originalPos;
		}

		//Setting back the dragging values to default
		m_DraggingIcon.GetComponent<CanvasGroup> ().blocksRaycasts = true; //re-enable the raycast blocking (so that clicking on it is detected)
		returnToOriginalPos = true;
		GetComponent<Image> ().color = defaultColor;

		//communicating dragging info to the canvas system
		canvasSystem.dragging = false;
		canvasSystem.imageBeingDragged = null;

		//Setting the surrounding tiles to null;
		TileTop = null;
		TileBottom = null;
		TileLeft = null;
		TileRight = null;
		linkedTiles.Clear ();
	}
    

	//USED IN THE FUNCTIONS PREVIOUSLY
	static public T FindInParents<T> (GameObject go) where T : Component
	{
		if (go == null)
			return null;
		var comp = go.GetComponent<T> ();

		if (comp != null)
			return comp;

		Transform t = go.transform.parent;
		while (t != null && comp == null) {
			comp = t.gameObject.GetComponent<T> ();
			t = t.parent;
		}
		return comp;
	}

	//FUNCTION TO MOVE IN HIERARCHY (in order to control the rendering order)
	public void MoveInHierarchy (int delta)
	{
		int index = transform.GetSiblingIndex ();
		transform.SetSiblingIndex (index + delta);
	}


	public void EnableCursorOver ()
	{
		cursorOver = true;
		GetComponent<Image> ().color = cursorOverColor;
	}


	public void DisableCursorOver ()
	{
		cursorOver = false;
		GetComponent<Image> ().color = defaultColor;
	}



	void Update ()
	{
		//CHECK WHEN THE PLAYER IS DRAGGING ANOTHER IMAGE ON TOP OF THIS ONE
		if (canvasSystem.dragging == true && cursorOver == true && canvasSystem.imageBeingDragged != m_DraggingIcon) {
			otherImageDraggedOver = true;
		} else {
			otherImageDraggedOver = false;
		}
		CheckLinkedTiles ();
		if (startingTile == false) {
			CheckIfConnectedToStart ();
		}
	}

	//CHECK THE SURROUDING TILES + IF THEY ARE LINKED TOGETHER
	public void CheckLinkedTiles ()
	{
		linkedTiles.Clear (); //Set to 0 before counting the number of links (otherwise a tile can get mroe than one link)

		foreach (GameObject image in canvasSystem.images) {
			imageDragHandler = image.GetComponent<MazeTile_Script> ();

			//Check tile on top
			if (imageDragHandler.currentCoordX == currentCoordX && imageDragHandler.currentCoordY == currentCoordY + 1) {
				TileTop = image;
				if (TileTop != null && imageDragHandler.linkDown == true && linkUp == true) {
					if (!linkedTiles.Contains (image)) {
						linkedTiles.Add (image);
					}
				}
			}
			//Check tile bottom
			if (imageDragHandler.currentCoordX == currentCoordX && imageDragHandler.currentCoordY == currentCoordY - 1) {
				TileBottom = image;
				if (TileBottom != null && imageDragHandler.linkUp == true && linkDown == true) {
					if (!linkedTiles.Contains (image)) {
						linkedTiles.Add (image);
					}
				}
			}
			//Check tile right
			if (imageDragHandler.currentCoordX == currentCoordX + 1 && imageDragHandler.currentCoordY == currentCoordY) {
				TileRight = image;
				if (TileRight != null && imageDragHandler.linkLeft == true && linkRight == true) {
					if (!linkedTiles.Contains (image)) {
						linkedTiles.Add (image);
					}
				}
			}
			//Check tile left
			if (imageDragHandler.currentCoordX == currentCoordX - 1 && imageDragHandler.currentCoordY == currentCoordY) {
				TileLeft = image;
				if (TileLeft != null && imageDragHandler.linkRight == true && linkLeft == true) {
					if (!linkedTiles.Contains (image)) {
						linkedTiles.Add (image);
					}
				}
			}
		}
	}

	public void CheckIfConnectedToStart ()
	{
		if (linkedTiles.Count != 0) {
			for (int i = 0; i < linkedTiles.Count; i++) {
				if (linkedTiles [i].GetComponent<MazeTile_Script> ().linkedToStart == true) {
					linkedToStart = true;
					break;
				} else {
					linkedToStart = false;
				}
			}
		} else {
			linkedToStart = false;
		}
			
	}

	public void ShuffleTile ()
	{
		xShuffle = Random.Range (0, 5);
		yShuffle = Random.Range (0, 5);
		foreach (GameObject image in canvasSystem.images) {
			
			imageDragHandler = image.GetComponent<MazeTile_Script> ();
				
			if (imageDragHandler.currentCoordX == xShuffle && imageDragHandler.currentCoordY == yShuffle && imageDragHandler.movable == true) {

				originalPos = GetComponent<RectTransform> ().position; //rememberOriginalPosition

				GetComponent<RectTransform> ().position = image.GetComponent<RectTransform> ().position;
				image.GetComponent<RectTransform> ().position = originalPos;

				tempCoordX = imageDragHandler.currentCoordX;
				tempCoordY = imageDragHandler.currentCoordY;

				imageDragHandler.currentCoordX = currentCoordX;
				imageDragHandler.currentCoordY = currentCoordY;
				currentCoordX = tempCoordX;
				currentCoordY = tempCoordY;

				hasBeenSwitched = true;
				imageDragHandler.hasBeenSwitched = true;

				break;
			}
		}
	}
}