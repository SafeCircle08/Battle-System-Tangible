function manageTextInputs(text, inBattle, isActionFlavourText) {
	
	var _cam = view_camera[view_current];
	var _camW = camera_get_view_width(_cam);
	var _camH = camera_get_view_height(_cam);
	var _camX = camera_get_view_x(_cam);
	var _camY = camera_get_view_y(_cam);
	
	//Sprite properties
	var _sprTextBox = setToGuiTxtBoxSelectedTheme();
	var _boxW = sprite_get_width(_sprTextBox); 
	var _boxH = sprite_get_height(_sprTextBox);
	
	var _scale = 1;
	var _bX = 10;
	var _bY = _bX - 1;
	var _lSep = 15;
	var _maxWidth = sprite_get_width(setToGuiTxtBoxSelectedTheme()) - _bX;
	
	var _scaleX = _scale;
	var _scaleY = _scale;
	var _txtBoxX = _camX + (_camW / 2);
	var _txtBoxY = _camY + _camH - 3;
	
	if (inBattle == false) {
		var _tollerance = 20;
		if (oPlayerOW.y > _camH / 2) {
			_txtBoxY = _camY + _boxH + 2; 
		}
	}
	
	if (global.getTextBoxInputs) {
		manageEnemySpeechAutoSkip(text, inBattle);
		
		if (confirmTextPressed() && (textFinished(text))) {
			if (morePages(text)) { 
				goToNextPage();	
				return;
			} else {
				if (!inBattle) { destroyTextBoxOW(_txtBoxX, _txtBoxY); } 
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