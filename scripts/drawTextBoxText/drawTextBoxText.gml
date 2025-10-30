#macro TEXT_FINISHED_TIMER 30

global.getTextBoxInputs = true;

function dontGetTextInputs() { 
	global.getTextBoxInputs = false;
	return global.getTextBoxInputs;
}
function getTextInputs() { 
	global.getTextBoxInputs = true; 
	return global.getTextBoxInputs;	
}

function setToFirstPage() {
	textFinishedTimer = TEXT_FINISHED_TIMER;
	charCount = 0;
	page = 0;
}	

function goToNextPage() {
	textFinishedTimer = TEXT_FINISHED_TIMER;
	page++;
	charCount = 0;
}

function textUnfinished(_textList) {
	return (charCount < string_length(_textList[page]));
}	

function textFinished(_textList) {
	textFinishedTimer = setTimer(textFinishedTimer);
	if (textFinishedTimer <= 0) {
		return (charCount >= string_length(_textList[page]));
	}
}

function pagesFinished(_textList) {
	return (page == array_length(_textList));
}

function showFullText(_textList) {
	charCount = string_length(_textList[page]);	
}	

function checkForPauses(_textList, _pointDelay = 10, commaDelay = 5) {
	if (string_char_at(_textList[page], charCount) == "." || 
		string_char_at(_textList[page], charCount) == "?" || 
		string_char_at(_textList[page], charCount) == "!" ) { dialogueDelay = _pointDelay; }
	if (string_char_at(_textList[page], charCount) == ",") { dialogueDelay = commaDelay; }		
}

function canAdvanceText(_textList) {
	return (dialogueDelay == 0) && (charCount < string_length(_textList[page]));
}

function morePages(_textList) {
	return (page + 1 < array_length(_textList));
}

function advanceText(_textList, _advanceSound, _pDel = 10, _cDel = 5) {
	charCount += speechSpeed;	
	playVoice(_advanceSound, 1, _textList);
	checkForPauses(_textList, _pDel, _cDel);
}

function drawTextBoxText(
	_textList, _font = Mono, isBattleFlavourText = false, 
	_confirmKey = vk_enter, inBox = true, inBattle = false, 
	_txtSound = sndBasicTxt1, _pDel = 10, _cDel = 5,
	_bX = 10, _bY = _bX - 1, _lSep = 15, _maxWidth = sprite_get_width(sTextBoxBg) - _bX,
	_scale = 1, _textX = undefined, _textY = undefined,
	_enemySpeech = false
) {
	var _cam = view_camera[view_current];
	var _camW = camera_get_view_width(_cam);
	var _camH = camera_get_view_height(_cam);
	var _camX = camera_get_view_x(_cam);
	var _camY = camera_get_view_y(_cam);
	
	//Sprite properties
	var _sprTextBox = global.selectedGuiStyle.textBox;
	var _boxW = sprite_get_width(_sprTextBox); 
	var _boxH = sprite_get_height(_sprTextBox);
	
	var _txtBoxX = _camX + (_camW / 2) - 1;
	var _txtBoxY = _camY + _camH - 3;
	
	if (inBattle) { 
		_confirmKey = ord("Z"); 
	}
	
	if (inBattle == false)
	{
		var _tollerance = 20;
		if (oPlayerOW.y > _camH / 2) {
			_txtBoxY = _camY + _boxH + 2; //up to the screen
		}
	}
	
	if (inBox) { 
		draw_sprite(_sprTextBox, 0, _txtBoxX, _txtBoxY);	
	}
	
	if (isBattleFlavourText) && (oBattleManager.isEnemySpeaking()) { return; }
	
	//Text Properties + Coords
	var _borderX = _bX;
	var _borderY = _bY;
	var _lineSep = _lSep;
	var _maxW = _maxWidth;
	var _txtScale = _scale;
	var _txtX = _txtBoxX - (_boxW / 2) + _borderX;
	var _txtY = _txtBoxY - _boxH + _borderY;
	if (_textX != undefined) && (_textY != undefined) {
		_txtX = _textX + 3;
		_txtY = _textY;
	}	
	
	static arrowIndex = 0.1;
	arrowIndex += 0.1;
	
	if (_enemySpeech) {
		var _bgSpr = sTextBG;
		draw_sprite(sTextBG, 0, _textX, _textY);
		var _bgW = sprite_get_width(_bgSpr);
		var _bgH = sprite_get_height(_bgSpr);
		if (textFinished(_textList)) { 
			draw_sprite(sNextPageArrow, arrowIndex, _textX + _bgW - _borderX * 3, _textY + _boxH - _borderY - 3); 
		}
	}
	
	if (inBox) { draw_sprite(_sprTextBox, 0,  _txtBoxX, _txtBoxY); }
	dialogueDelay = setTimer(dialogueDelay);
	if (canAdvanceText(_textList)) { advanceText(_textList, _txtSound, _pDel, _cDel); }
	
	var _textPart = string_copy(_textList[page], 1, charCount);
	draw_set_font(_font);
	draw_set_color(c_dkgray);
	draw_text_ext_transformed(_txtX + 0.5, _txtY + 0.5, _textPart, _lineSep, _maxW, _scale, _scale, 0);
	draw_set_color(c_white);
	draw_text_ext_transformed(_txtX, _txtY, _textPart, _lineSep, _maxW, _scale, _scale, 0);
	
	if (textFinished(_textList)) {
		if (_enemySpeech == false) {
			if (!morePages(_textList)) { draw_sprite(sPagesAllWritten_NowRestart, 0, _txtBoxX + 118, _txtBoxY - 7); }
			draw_sprite(sNextPageArrow, arrowIndex, _txtBoxX + 108, _txtBoxY - 7); 
		}
	}
		
	//Managing text
	if (global.getTextBoxInputs) {
		if (confirmTextPressed() && (textFinished(_textList))) {
			if (morePages(_textList)) { 
				goToNextPage();	
				return;
			}
			else {
				if (inBattle == false) { destroyTextBoxOW(); }
				else {
					if (oBattleManager.isEnemySpeaking()) {
						oBattleManager.enemyTextShowed = true;
						oBattleManager.changeTurn();
					} else {
						if (oBattleManager.showingExtraMonologueText) {
							setToOriginalMonologue();
							return;
						}
					}
				}
				
				if (isBattleFlavourText) {
					with (oBattleManager) {
						if (enemyTextShowed == false) { showEnemyText(); }
						if (enemyTextShowed == true) { changeTurn(); }
					}
				}
				speechSpeed = 0.5;
				setToFirstPage();
				return;
			}  
		}
		if (charCount >= 1) { 
			if (confirmTextPressed() && textUnfinished(_textList)) { showFullText(_textList); }
		}
	}
}