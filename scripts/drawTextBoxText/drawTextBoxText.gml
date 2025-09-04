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
	charCount = 0;
	page = 0;
}	

function goToNextPage() {
	page++;
	charCount = 0;
}

function textUnfinished(_textList) {
	return (charCount < string_length(_textList[page]));
}	

function textFinished(_textList) {
	return (charCount >= string_length(_textList[page]));		
}

function pagesFinished(_textList) {
	print(page)
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

function advanceText(_textList, _advanceSound) {
	charCount += speechSpeed;	
	playVoice(_advanceSound, 1, _textList);
	checkForPauses(_textList);
}

function drawTextBoxText(_textList, _font = Mono, inBox = true, inBattle = false, _txtSound = sndBasicTxt1) 
{
	var _cam = view_camera[view_current];
	var _camW = camera_get_view_width(_cam);
	var _camH = camera_get_view_height(_cam);
	var _camX = camera_get_view_x(_cam);
	var _camY = camera_get_view_y(_cam);
	
	//Sprite properties
	var _sprTextBox = sTextBoxBg;
	var _boxW = sprite_get_width(_sprTextBox); 
	var _boxH = sprite_get_height(_sprTextBox)
	
	var _txtBoxX = _camX + (_camW / 2) - 1;
	var _txtBoxY = _camY + _camH;
	
	if (inBattle == false) {
		var _tollerance = 20;
		if (oPlayerOW.y > _camH / 2) {
			_txtBoxY = _camY + _boxH + 2; //up to the screen
		}
	}
	var _confirmKey = vk_enter;
	if (inBattle) { 
		_confirmKey = ord("Z"); 
		_txtSound = sndBasicTxt2;
	}
	
	if (inBox) { draw_sprite(_sprTextBox, 0,  _txtBoxX, _txtBoxY); }
	
	//Adds delay if it finds commas or point etc...
	dialogueDelay = setTimer(dialogueDelay);
	if (canAdvanceText(_textList)) { advanceText(_textList, _txtSound); }
	
	//Text Properties + Coords
	var _borderX = 10;
	var _borderY = _borderX - 2;
	var _lineSep = 15;
	var _maxW = _boxW - (_borderX);
	var _txtScale = 1;
	var _txtX = _txtBoxX - (_boxW / 2) + _borderX;
	var _txtY = _txtBoxY - _boxH + _borderY;
	
	var _textPart = string_copy(_textList[page], 1, charCount);
	draw_set_font(_font);
	draw_set_color(c_dkgray);
	draw_text_ext(_txtX + 0.5, _txtY + 0.5, _textPart, _lineSep, _maxW);
	draw_set_color(c_white);
	draw_text_ext(_txtX, _txtY, _textPart, _lineSep, _maxW);
	
	static arrowIndex = 0.1;
	arrowIndex += 0.1;
	
	if (textFinished(_textList)) { 
		if (!morePages(_textList)) { draw_sprite(sPagesAllWritten_NowRestart, 0, _txtBoxX + 118, _txtBoxY - 7); print("toriel sesso")}
		draw_sprite(sNextPageArrow, arrowIndex, _txtBoxX + 108, _txtBoxY - 7); 
	}
	
	//Managing text
	if (global.getTextBoxInputs == true) {
		if (keyboard_check_pressed(_confirmKey) && (textFinished(_textList)))
		{
			if (morePages(_textList)) { 
				goToNextPage();	
				return;
			}
			else 
			{
				if (inBattle == false) {
					oPlayerOW.canMove = true;
					instance_destroy();
				}
				speechSpeed = 0.5;
				setToFirstPage();
				return;
			}  
		}
		if (charCount > 5) { if (keyboard_check_pressed(_confirmKey) && (textUnfinished(_textList))) { showFullText(_textList); } }
	}
}