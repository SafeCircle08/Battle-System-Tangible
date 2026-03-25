function drawTextStyle(_txtX, _txtY, _page, _textPart, _lSep, _maxW, _scale) {
	var _charN = floor(charCount);
	var _baseX = _txtX;
	var _baseY = _txtY;
	var _fx = _page.effect;
	var _color = _page.color;
	var _letterAdderX = 0;
	var _letterAdderY = 0;
	
	draw_set_colour(_color);
	for (var i = 1; i <= _charN; i++) {
		var _letter = string_char_at(_textPart, i);
		
		switch (_fx) {
			case TXT_ANIM.WAVEY:
				var _f = 200;
				_letterAdderX = cos(current_time / _f + i);
				_letterAdderY = sin(current_time / _f + i);
			break;
			case TXT_ANIM.SHAKY:
				var _adder = 0.8;
				_letterAdderX = irandom_range(-1, 1);
				_letterAdderY = irandom_range(-1, 1);
				if (_letterAdderX >= 0) { _letterAdderX -= _adder; }
				else { _letterAdderX += _adder; }
				if (_letterAdderY >= 0) { _letterAdderY -= _adder; }
				else { _letterAdderY += _adder; }
			break;
		}
		
		if (_letter == "\n") {
			_txtY += _lSep;
			_txtX = _baseX;
			continue;
		}
		
		draw_text_transformed(_txtX + _letterAdderX, _txtY + _letterAdderY, _letter, _scale, _scale, 0);
		_txtX += string_width(_letter) * _scale;
	}
	draw_set_colour(c_white);	
}