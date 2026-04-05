function manageTextInputs() {
	#region	DECLARING X, Y POSITIONS
	
	if (inBattle == false) {
		var _tollerance = 20;
		if (oPlayerOW.y > camH / 2) { txtBoxY = camY + boxH; }
	}
	
	#endregion
	
	#region ACTUAL INPUTS SECTION
	if (global.getTextBoxInputs == false) return;
	
	var pag = pagesList[page];
	var text = pag.contents;
	
	if (pag.isMinigame == true) { 
		manageMinigamePage(pag);
		return;
	}
	
	if (confirmTextPressed() && textFinished(text)) {
		if (morePages(pagesList)) {
			goToNextPage();
			return;
		}
		
		//if the pages are over
		if (!inBattle) { 
			destroyTextBoxOW(txtBoxX, txtBoxY);
		} else {
			if (oBattleManager.isEnemySpeaking()) {
				if (enemyAfterTurnText == false) {
					oBattleManager.changeTurnAfterEnemySpeech(); //enemy speech -> bullet hell
					//mettere qui la funzione per al posto di terminare il turno
					//andare ad iniziarlo: setToStartTurn() (mi sembra fosse)
				}
				else with (oBattleManager) setToTurnFinished(); //enemy speech after bullet hell -> player turn
			} else if (oBattleManager.showingExtraMonologueText) {
				setToOriginalBattleFlavourText();
				return;
			}
		}
		
		if (isActionsFlavourText) {
			with (oBattleManager) {
				if (!enemyTextShowed) { showEnemyText(); }
				else { setToStartTurn(); }
			}
		}
		
		speechSpeed = 0.5;
		setToFirstPage();
		return;	
	}
	
	if (confirmTextPressed() && charCount > 1 && textUnfinished(text)) showFullText(text);
	
	#endregion
}