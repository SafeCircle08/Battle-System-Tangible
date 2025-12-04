if (initialized == true) {
	draw_set_alpha(image_alpha);
	var _cardW = sprite_get_width(sSegnalinoCardBase);
	var _cardH = sprite_get_height(sSegnalinoCardBase);
	var _border = 10;

	var _sprSegXOffset = 33;
	var _sprSegYOffset = 2;

	draw_sprite(baseCardSpr, 0, x, y);
	draw_sprite(segSprite, 0, x - _sprSegXOffset, y - _sprSegYOffset);

	var _topCardY = y - 1;
	var _levelBorder = 6;
	var _levelX = x - (_cardW / 2) + (_levelBorder * 2) - 1;
	var VALUE_OFFSET = 5;
	
	//The level
	draw_sprite(levelSpr, levelSprIndex, _levelX + 2, _topCardY);
	
	//The type
	var _typeSprX = _levelX + sprite_get_width(levelSpr) + VALUE_OFFSET;
	draw_sprite(typeSpr, typeSprIndex, _typeSprX, _topCardY);
	
	//The number values
	draw_set_font(fMiniNumbers);
	var _numberValY = _topCardY - string_height(minValue) + 2;
	var _numValsX = _typeSprX + sprite_get_width(typeSpr);
	
	var _fMinValue = string_format(minValue, 0, 1);
	var _fMaxValue = string_format(maxValue, 0, 1);
	
	draw_text(_numValsX + VALUE_OFFSET, _numberValY, string(_fMinValue) + ">" + string(_fMaxValue));
	
	//The name
	draw_set_font(fHungrySkinny);
	var _nameX = x - (_cardW / 2) + 15;
	var _nameY = y;
	draw_text_transformed(_nameX, _nameY, name, 0.5, 0.5, 0);
	
	//The timer
	var _timerX = _nameX + (string_width(name) / 2) - 4;
	var _timerY = _nameY;
	
	draw_text_transformed(_timerX, _timerY, formatTimerMSS(refSegnalinoInst.timer), 0.5, 0.5, 0);
	
	draw_set_alpha(1);
}