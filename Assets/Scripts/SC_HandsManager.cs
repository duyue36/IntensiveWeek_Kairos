using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SC_HandsManager : MonoBehaviour {

    public List<SC_SmallHand> handsList = new List<SC_SmallHand>();
    public SC_BigHand bigHandScript;
    SC_SmallHand tempToShuffle;
    int handCounter;

    public void StartHands()    // called when a puzzle is started
    {
        ShuffleHandsOrder();
        StartCoroutine(WaitBeforeFirstHand());
        //StartCoroutine(WaitBeforeBigHand());
    }

    public void StopHands()    // called when a puzzle is stopped
    {
        StopAllCoroutines();
        if (handCounter > 0)
        {
            foreach (SC_SmallHand item in handsList)
            {
                item.myImage.enabled = false;
                item.HideHand();
            }
        }
		bigHandScript.HideHand ();
    }

    public void ShuffleHandsOrder()
    {
        for (int i = 0; i < handsList.Count; i++)
        {
            tempToShuffle = handsList[i];
            handsList.Remove(tempToShuffle);
            handsList.Insert(Random.Range(0, handsList.Count), tempToShuffle);
        }
    }

    IEnumerator WaitBeforeFirstHand()
    {
        yield return new WaitForSeconds(5f);
        StartCoroutine(WaitBeforeNewHand());
    }

    IEnumerator WaitBeforeNewHand()
    {
        handsList[handCounter].ShowHand();
        yield return new WaitForSeconds(2.7f);
        if (handCounter < handsList.Count - 1)
        {
            handCounter++;
            StartCoroutine(WaitBeforeNewHand());
        }
        else
        {
            handCounter = 0;
            ShuffleHandsOrder();
            StartCoroutine(WaitBeforeBigHand());
        }
    }

    IEnumerator WaitBeforeBigHand()
    {
        yield return new WaitForSeconds(.5f);
        foreach (SC_SmallHand item in handsList)
        {
            item.HideHand();
        }
        yield return new WaitForSeconds(1f);
        bigHandScript.ShowHand();
        yield return new WaitForSeconds(10f);
        StartCoroutine(WaitBeforeFirstHand());
    }
}
