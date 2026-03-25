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
					oBattleManager.changeTurnAfterEnemySpeech();
					//mettere qui la funzione per al posto ti terminare il turno
					//andare ad iniziarlo: setToStartTurn() (mi sembra fosse)
				}
				else with (oBattleManager) setToTurnFinished();
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