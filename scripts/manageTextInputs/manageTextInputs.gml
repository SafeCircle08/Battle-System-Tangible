function manageTextInputs(text, txtX, txtY, inBattle, isActionFlavourText) {
	if (global.getTextBoxInputs) {
		manageEnemySpeechAutoSkip(text, inBattle);
		
		if (confirmTextPressed() && (textFinished(text))) {
			if (morePages(text)) { 
				goToNextPage();	
				return;
			} else {
				if (!inBattle) { destroyTextBoxOW(txtX, txtY); } 
				else {
					if (oBattleManager.isEnemySpeaking()) { 
						oBattleManager.changeTurnAfterEnemySpeech(); 
					} else if (oBattleManager.showingExtraMonologueText) {
						setToOriginalBattleFlavourText();
						return;
					}
				}
			}
				
			if (isActionFlavourText) {
				with (oBattleManager) {
					if (enemyTextShowed == false) { showEnemyText(); }
					if (enemyTextShowed == true) { changeTurn(); }
				}
			}
			
			speechSpeed = 0.5;
			setToFirstPage();
			return; 
		}
		
		var _minCharsToShow = 1;
		if (charCount >= _minCharsToShow) { 
			if (confirmTextPressed() && textUnfinished(text)) { showFullText(text); }
		}
	}
}