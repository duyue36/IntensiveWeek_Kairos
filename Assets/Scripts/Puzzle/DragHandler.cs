using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

//[RequireComponent(typeof(Image))]
public class DragHandler : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{

	//COORDINATES VALUES
	public int currentCoordX;
	public int currentCoordY;

	public int correctCoordX;
	public int correctCoordY;

    public bool fromOuterRing;
    public bool fromMiddleRing;
    public bool fromInnerRing;

	//VISUAL FEEDBACK VALUES
	public Color defaultColor;
	public Color cursorOverColor;
	public Color draggedColor;
    public Color disabledColor;

    //GAMEPLAY VALUES
    public bool missing;
    public bool movable;
	public bool correctlyPlaced;

	private bool otherImageDraggedOver;

	private bool returnToOriginalPos;

	//DRAGGING VALUES
    public bool dragOnSurfaces = true;

    private GameObject m_DraggingIcon;
    private RectTransform m_DraggingPlane;

    private Vector2 originalPos;

	public Script_CanvasSystem canvasSystem;

	public bool cursorOver;

	private Vector2 originalSize;

    public Transform myRectTransform;

    public void Start()
    {
        returnToOriginalPos = true;
        originalSize = GetComponent<RectTransform>().sizeDelta;

        // -------------------------- Added by Isabelle -------------------------- //
        myRectTransform = GetComponent<RectTransform>();
        //ActualizeCoord();

        if (!movable)
        {
            if (missing)
            {
                GetComponent<Image>().color = Color.black;
            }
            else
            {
                GetComponent<Image>().color = disabledColor;
            }
        }
    }

    public void ActualizeCoord()
    {
        currentCoordX = (int)(myRectTransform.localPosition.x + 125) / 50;
        currentCoordY = (int)(myRectTransform.localPosition.y + 125) / 50;
    }


    //START DRAG
    public void OnBeginDrag(PointerEventData eventData)
    {
        var canvas = FindInParents<Canvas>(gameObject);
        if (canvas == null)
            return;
        // We have clicked something that can be dragged.

		if (movable == true) // What we want to do is create an icon for this. This works only if the object is "movable"
		{
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
			GetComponent<CanvasGroup>().blocksRaycasts = false;

			GetComponent<Image>().color = draggedColor; //change the color to the dragged color
			MoveInHierarchy (100); //Put in front of everything in the UI
		}
    }


	//WHILE DRAGGING
    public void OnDrag(PointerEventData data)
    {
		if (m_DraggingIcon != null && movable == true)
		{
			SetDraggedPosition (data);
			GetComponent<Image>().color = draggedColor; //change the color to the dragged color
		}
    }


	//FUNCTION TO SET POSITION WHILE DRAGGING
    private void SetDraggedPosition(PointerEventData data)
    {
        if (dragOnSurfaces && data.pointerEnter != null && data.pointerEnter.transform as RectTransform != null)
            m_DraggingPlane = data.pointerEnter.transform as RectTransform;

        var rt = m_DraggingIcon.GetComponent<RectTransform>();
        Vector3 globalMousePos;
        if (RectTransformUtility.ScreenPointToWorldPointInRectangle(m_DraggingPlane, data.position, data.pressEventCamera, out globalMousePos))
        {
            rt.position = globalMousePos;
            rt.rotation = m_DraggingPlane.rotation;
			rt.sizeDelta = originalSize;
        }
    }


	//END DRAG
    public void OnEndDrag(PointerEventData eventData)
    {
		var dragHandlerDragged = m_DraggingIcon.GetComponent<DragHandler> ();

		foreach (DragHandler image in canvasSystem.images) //Check if there is an image under the dragged image
		{
            if (image.otherImageDraggedOver == true && image.movable == true && image.fromInnerRing == fromInnerRing && image.fromMiddleRing == fromMiddleRing && image.fromOuterRing == fromOuterRing)
			{
				//switch position and coordinates
				m_DraggingIcon.GetComponent<RectTransform>().position = image.GetComponent<RectTransform>().position;
				image.GetComponent<RectTransform>().position = originalPos;
				returnToOriginalPos = false;

				var tempCoordX = image.currentCoordX;
				var tempCoordY = image.currentCoordY;

                image.currentCoordX = dragHandlerDragged.currentCoordX;
                image.currentCoordY = dragHandlerDragged.currentCoordY;
				dragHandlerDragged.currentCoordX = tempCoordX;
				dragHandlerDragged.currentCoordY = tempCoordY;

				break;
			}
		}

		if (returnToOriginalPos == true) //If the image has not been dragged over another movable image, then it comes back to its original position
		{
			m_DraggingIcon.GetComponent<RectTransform> ().position = originalPos;
		}

		//Setting back the dragging values to default
		m_DraggingIcon.GetComponent<CanvasGroup>().blocksRaycasts = true; //re-enable the raycast blocking (so that clicking on it is detected)
		returnToOriginalPos = true;
		GetComponent<Image> ().color = defaultColor;

		//communicating dragging info to the canvas system
		canvasSystem.dragging = false;
		canvasSystem.imageBeingDragged = null;
    }
    

    //USED IN THE FUNCTIONS PREVIOUSLY
    static public T FindInParents<T>(GameObject go) where T : Component
    {
        if (go == null) return null;
        var comp = go.GetComponent<T>();

        if (comp != null)
            return comp;

        Transform t = go.transform.parent;
        while (t != null && comp == null)
        {
            comp = t.gameObject.GetComponent<T>();
            t = t.parent;
        }
        return comp;
    }

	//FUNCTION TO MOVE IN HIERARCHY (in order to control the rendering order)
	public void MoveInHierarchy(int delta)
	{
		int index = transform.GetSiblingIndex();
		transform.SetSiblingIndex (index + delta);
	}
		

	public void EnableCursorOver()
	{
        if (movable)
        {
            cursorOver = true;
            GetComponent<Image>().color = cursorOverColor;
        }
	}


	public void DisableCursorOver()
	{
        if (movable)
        {
            cursorOver = false;
            GetComponent<Image>().color = defaultColor;
        }
	}



	void Update()
	{
		//CHECK WHEN THE PLAYER IS DRAGGING ANOTHER IMAGE ON TOP OF THIS ONE
		if (canvasSystem.dragging == true && cursorOver == true && canvasSystem.imageBeingDragged != m_DraggingIcon)
		{
			otherImageDraggedOver = true;
		}
		else
		{
			otherImageDraggedOver = false;
		}

		//CHECK IF THE IMAGE IS CORRECTLY PLACED
		if (currentCoordX == correctCoordX && currentCoordY == correctCoordY) {
			correctlyPlaced = true;
		} else {
			correctlyPlaced = false;
		}

	}

    // -------------------------- Added by Isabelle -------------------------- //
    public void Unlocked()
    {
        movable = true;
        missing = false;
        GetComponent<Image>().color = Color.white;
    }
}