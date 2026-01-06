#macro TEXT_FINISHED_TIMER 20
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

function checkForPauses(_textList, _pointDelay = poinDelay, _commaDelay = commaDelay) {
	if (string_char_at(_textList[page], charCount) == "." || 
		string_char_at(_textList[page], charCount) == "?" || 
		string_char_at(_textList[page], charCount) == "!" ) { dialogueDelay = commaDelay; }
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

function drawUnderText(_txtX, _txtY, _textPart, _lineSep, _maxW, _scale, _angle, _offset = 0.5, _col = c_dkgray) {
	draw_set_color(_col);
	draw_text_ext_transformed(_txtX + _offset, _txtY + _offset, _textPart, _lineSep, _maxW, _scale, _scale, 0);		
}

function manageEnemySpeechAutoSkip(_textList, _inBattle) {
	if (textFinished(_textList) && (_inBattle) && (!morePages(_textList))) {
		if (oBattleManager.isEnemySpeaking()) {
			autoSkipTimer = setTimer(autoSkipTimer);
			if (autoSkipTimer == 0) { oBattleManager.changeTurnAfterEnemySpeech(); }
		}
	}		
}

function drawEnemySpeech(_textList, _x, _y, arrowIndex) {
	var _bgSpr = sTextBG;
	draw_sprite(_bgSpr, 0, _x, _y);
	var _bgW = sprite_get_width(_bgSpr);
	var _bgH = sprite_get_height(_bgSpr);
	var _borderX = 30;
	var _borderY = 12;
	if (textFinished(_textList)) { 
		draw_sprite(sNextPageArrow, arrowIndex, _x + _bgW - _borderX, _y + _bgH - _borderY); 
	}		
}

#endregion

function drawTextBoxText(
	_textList, _font = Mono, _character = false, isActionsFlavourText = false, 
	inBox = true, inBattle = false, _sound = sndBasicTxt5, _enemySpeech = false, _textX = undefined, _textY = undefined,
) {
	#region INITIALIZATION SECTION
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
			_txtBoxY = _camY + _boxH; 
		}
	}
	
	if (inBox) { draw_sprite(_sprTextBox, 0, _txtBoxX, _txtBoxY); }
	
	#endregion
	
	#region TEXT PROPERTIES + COORDINATES, ARROW DECO, 
	var _borderX = _bX;
	var _borderY = _bY;
	var _lineSep = _lSep;
	var _maxW = _maxWidth;
	var _txtScale = _scale;
	var _txtX = _txtBoxX - (_boxW / 2) + _borderX;
	var _txtY = _txtBoxY - _boxH + _borderY;
	if (_textX != undefined) && (_textY != undefined) {
		_txtX = _textX + 5;
		_txtY = _textY;
	}	
	
	static arrowIndex = 0.1;
	arrowIndex += 0.1;
	
	#endregion
	
	#region ENEMY SPEECH SECTION
	if (_enemySpeech) {
		_scaleX = 0.5;
		_scaleY = 0.5;
		drawEnemySpeech(_textList, _textX, _textY, arrowIndex);
	}
	
	#endregion
	
	#region THE TEXTBOX DRAWN TEXT
	var _pDel = 10;
	var _cDel = 5;
	dialogueDelay = setTimer(dialogueDelay);
	if (canAdvanceText(_textList)) { advanceText(_textList, _sound, _pDel, _cDel); }
	
	//The drawn text
	var _textPart = string_copy(_textList[page], 1, charCount);
	var _offset = 0.5;
	draw_set_font(_font);
	
	if (_character == true && characterFaces[page] != FACIAL_EXPRESSIONS.FACIAL_HIDDEN_FACE) {
		var _face = characterFaces[page];
		draw_sprite(faceSpriteRef, _face, _txtX - 2, _txtY - 1);
		_txtX = 60;
	}
	
	drawUnderText(_txtX, _txtY, _textPart, _lineSep, _maxW, _scaleX, 0);
	
	try {
		var _amplitude = 5;
		var _freq = 30;		
		switch (pagesWithFXs[page]) {
			case TEXT_ANIMATIONS_FXS.TEXT_AN_SHAKE:
				var _shakeAmpli = 1;
				_txtX += irandom_range(-_shakeAmpli, _shakeAmpli);
				_txtY += irandom_range(-_shakeAmpli, _shakeAmpli);
				_txtX = clamp(_txtX, _txtX -_shakeAmpli, _txtX + _shakeAmpli);
				_txtY = clamp(_txtY, _txtY -_shakeAmpli, _txtY + _shakeAmpli);				
			break;
			case TEXT_ANIMATIONS_FXS.TEXT_AN_COS:
				_txtX += cos(existanceTextTime / _freq) * _amplitude;
			break;
			case TEXT_ANIMATIONS_FXS.TEXT_AN_SIN:
				_txtY += sin(existanceTextTime / _freq) * _amplitude;
			break;
			case TEXT_ANIMATIONS_FXS.TEXT_AN_CIRCLE:
				_txtX += cos(existanceTextTime / _freq) * _amplitude;
				_txtY += sin(existanceTextTime / _freq) * _amplitude;
			break;
			case TEXT_ANIMATIONS_FXS.TEXT_AN_W_H_CHANGE:
				_scaleX += (cos(existanceTextTime) / _freq * 50) / 70;
				_scaleY += (sin(existanceTextTime) / _freq * 50) / 70;
				_scaleX = clamp(_scaleX, -1, 1.3);
				_scaleY = clamp(_scaleY, -1, 1.3);
			break;
		}
	} catch (_exception) {}
	
	var _col = c_white;
	if (_character == true) { _col = colors[page]; }
	draw_set_color(_col);
	draw_text_ext_transformed(_txtX, _txtY, _textPart, _lineSep, _maxW, _scaleX, _scaleY, 0);		
	
	if (textFinished(_textList)) {
		if (_enemySpeech == false) {
			if (!morePages(_textList)) { draw_sprite(sPagesAllWritten_NowRestart, 0, _txtBoxX + 118, _txtBoxY - 7); }
			draw_sprite(sNextPageArrow, arrowIndex, _txtBoxX + 108, _txtBoxY - 7); 
		}
	}
	#endregion
}