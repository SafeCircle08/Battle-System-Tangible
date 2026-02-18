function manageTextInputs(text, inBattle, isActionFlavourText, _enemyAfterBulletHellTxt = false) {
	#region	DECLARING X, Y POSITIONS
	
	var _cam = view_camera[view_current];
	var _camW = camera_get_view_width(_cam);
	var _camH = camera_get_view_height(_cam);
	var _camX = camera_get_view_x(_cam);
	var _camY = camera_get_view_y(_cam);
	
	//Sprite properties
	var _sprTextBox = setToGuiTxtBoxSelectedTheme();
	var _boxW = sprite_get_width(_sprTextBox); 
	var _boxH = sprite_get_height(_sprTextBox);
	var _txtBoxX = _camX + (_camW / 2);
	var _txtBoxY = _camY + _camH - 3;
	
	if (inBattle == false) {
		var _tollerance = 20;
		if (oPlayerOW.y > _camH / 2) {
			_txtBoxY = _camY + _boxH; 
		}
	}
	
	#endregion
	
	#region ACTUAL INPUTS SECTION
	
	if (global.getTextBoxInputs == false) return;
	//manageEnemySpeechAutoSkip(text, inBattle);
	
	if (confirmTextPressed() && textFinished(text)) {
		if (morePages(text)) {
			goToNextPage();
			return;
		}
		
		//if the pages are over
		if (!inBattle) { destroyTextBoxOW(_txtBoxX, _txtBoxY); }
		else {
			if (oBattleManager.isEnemySpeaking()) {
				if (_enemyAfterBulletHellTxt == false) oBattleManager.changeTurnAfterEnemySpeech();
				else {
					//changeTurnAfterEnemyTextAfterBulletHellSection();	
					//(goes to start turn)
				}
			} else if (oBattleManager.showingExtraMonologueText) {
				setToOriginalBattleFlavourText();
				return;
			}
		}
		
		if (isActionFlavourText) {
			with (oBattleManager) {
				if (!enemyTextShowed) { showEnemyText(); }
				else { changeTurn(); }
			}
		}
		
		speechSpeed = 0.5;
		setToFirstPage();
		return;	
	}
	
	if (confirmTextPressed() && charCount >= 1 && textUnfinished(text)) showFullText(text);
	
	#endregion
}