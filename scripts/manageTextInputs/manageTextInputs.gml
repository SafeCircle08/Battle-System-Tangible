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
		
		if (!inBattle) { 
			destroyTextBoxOW(txtBoxX, txtBoxY);
		} else {
			with (oBattleManager) {
				if (isEnemySpeaking()) {
					if (onFirstTurn() && (bulletHellAfterIntro)) {
						setToStartTurn();
						return;
					}
					if (other.enemyAfterTurnText == false) changeTurnAfterEnemySpeech();
					else setToTurnFinished();						
				} else if (showingExtraMonologueText) {
					setToOriginalBattleFlavourText();
					return;
				}
			}
		}
		
		if (isActionsFlavourText) {
			with (oBattleManager) {
				if (!enemyTextShowed) showEnemyText();
				else setToStartTurn();
			}
		}
		
		speechSpeed = 0.5;
		setToFirstPage();
		return;	
	}
	
	if (confirmTextPressed() && charCount > 1 && textUnfinished(text)) showFullText(text);
	
	#endregion
}