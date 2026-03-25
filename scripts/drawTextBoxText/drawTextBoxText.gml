#macro TEXT_FINISHED_TIMER 15
global.getTextBoxInputs = true;

#region TEXT FUNCTIONS UTILS
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
function textUnfinished(_text) {
	return (round(charCount) < string_length(_text) - 2);
}
function textFinished(_text) {
	textFinishedTimer = setTimer(textFinishedTimer);
	if (textFinishedTimer <= 0) {
		return (charCount >= string_length(_text));
	}
}
function showFullText(_text) {
	charCount = string_length(_text);	
}	
function morePages(_textList) {
	return (page + 1 < array_length(_textList));
}
function manageEnemySpeechAutoSkip(_textList, _inBattle) {
	if (textFinished(_textList) && (_inBattle) && (!morePages(_textList))) {
		if (oBattleManager.isEnemySpeaking()) {
			autoSkipTimer = setTimer(autoSkipTimer);
			if (autoSkipTimer == 0) { oBattleManager.changeTurnAfterEnemySpeech(); }
		}
	}		
}
#endregion

function drawTextBoxText() {
	var _scale = 1;
	var _bX = 10;
	var _bY = _bX - 1;
	var _lSep = 15;
	var _maxW = sprite_get_width(sprTextBox) - _bX;
	
	#region LOCAL FUNCTIONS
	static canAdvanceText = function(_text) {
		return (dialogueDelay == 0) && (charCount < string_length(_text));
	}	
	static pagesFinished = function(_textList) {
		return (page == array_length(_textList));
	}
	static drawTextBoxText_hasPortrait = function(_page) {
		return (_page.faceSprRef != noone && _page.expression != FACES.HIDDEN);
	}
	static nextPageIsMinigame = function(_textList) {
		if (page + 1 >= array_length(_textList)) return false;
			return _textList[page + 1].isMinigame == true
	}
	static drawEnemySpeechBox = function(_x, _y) {
		var _bgSpr = sTextBG;
		draw_sprite(_bgSpr, 0, _x, _y);	
	}
	static txtHasCoords = function() {
		return (txtX != undefined) && (txtY != undefined);
	}
	static hasPortrait = function(_page) {
		return (_page.faceSprRef != noone && _page.expression != FACES.HIDDEN);
	}
	static advanceText = function(_text, _advanceSound, _pDel = 10, _cDel = 5) {
		static checkForPauses = function(_text, _pointDelay = poinDelay, _commaDelay = commaDelay) {
			if (string_char_at(_text, charCount) == "." || 
				string_char_at(_text, charCount) == "?" || 
				string_char_at(_text, charCount) == "!" ) { dialogueDelay = commaDelay; }
			if (string_char_at(_text, charCount) == ",") { dialogueDelay = commaDelay; }	
		}
		charCount += speechSpeed;	
		playVoice(_advanceSound, 1, _text);
		checkForPauses(_text, _pDel, _cDel);
	}
	#endregion
	
	if (inBox) draw_sprite(sprTextBox, 0, txtBoxX, txtBoxY);
	if (inBattle == false) {
		if (oPlayerOW.y > camH / 2 + 20) txtBoxY = camY + _boxH; 
	}
	
	static arrowIndex = 0.1;
	var _textList = pagesList;
	var _page = _textList[page];
	var _text = _page.contents;
	var _faceSprRef = _page.faceSprRef;
	var _expression = _page.expression;
	var _txtEffect = _page.effect;
	var _txtCol = _page.color;
	var _destroyPageFunc = _page.destroyPageFunc;
	var _borderX = _bX;
	var _borderY = _bY;
	var _txtX = txtBoxX - (boxW / 2) + _borderX;
	var _txtY = txtBoxY - boxH + _borderY;
	if (txtHasCoords()) {
		_txtX = txtX + 5;
		_txtY = txtY;
	}	
	
	//EnemySpeechBox
	if (enemySpeech == true) {
		_scale = 0.5;
		drawEnemySpeechBox(txtX, txtY);
	}
	
	//NPCs Portraits
	if (drawTextBoxText_hasPortrait(_page)) {
		draw_sprite(_faceSprRef, _expression, _txtX - 2, _txtY - 1);
		_txtX = 65;
	}
	
	//Actual Drawn Text
	dialogueDelay = setTimer(dialogueDelay);
	if (canAdvanceText(_text)) advanceText(_text, sound, 10, 5);
	var _textPart = string_copy(_text, 1, charCount);
	draw_set_font(font);

	switch (_txtEffect) {
		case TXT_ANIM.WAVEY:
			drawFormattedWaveyText(_txtX, _txtY, _textPart, _lSep, _txtCol, _scale);
		break;
		case TXT_ANIM.SHAKY:
			drawFormatShakyText(_txtX, _txtY, _textPart, _lSep, _txtCol, _scale);
		break;
		case TXT_ANIM.NOONE:
			if (enemySpeech) draw_text_ext_transformed(_txtX, _txtY, _textPart, _lSep, _maxW, _scale, _scale, 0);
			else drawFormatTypeWriterText(_txtX, _txtY, _textPart, _lSep, 0.6, _txtCol, _scale);
		break;
	}
	
	if (textFinished(_text)) {
		arrowIndex += 0.1;
		if (enemySpeech == true) return;
		if (nextPageIsMinigame(_textList)) draw_sprite(sNextPageTxtMinigame, arrowIndex, txtBoxX + 108, txtBoxY - 7);
		else draw_sprite(sNextPageArrow, arrowIndex, txtBoxX + 108, txtBoxY - 7);
		
		if (!morePages(_textList)) draw_sprite(sPagesAllWritten_NowRestart, 0, txtBoxX + 118, txtBoxY - 7);
	}
	#endregion
}