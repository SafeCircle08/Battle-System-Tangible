function drawShakyText(_x, _y, _string, _lSep, _color = c_white, _xShakePow = 1, _yShakePow = 1, scale = 1) {
	var _charN = floor(charCount);
	var _baseX = _x;
	var _baseY = _y;
	draw_set_colour(_color);
	for (var i = 1; i <= _charN; i++) {
		var _letter = string_char_at(_string, i);
		var _letterAdderX = 0;
		var _letterAdderY = 0;
		if (current_time % 2 == 0) {
			_letterAdderX = irandom_range(-1, 1);
			_letterAdderY = irandom_range(-1, 1);
			_letterAdderX = clamp(_letterAdderX, -0.6, 0.6);
			_letterAdderY = clamp(_letterAdderY, -0.8, 0.8);
		}
		if (_letter == "\n") {
			_y += _lSep;
			_x = _baseX;
			continue;
		}
		
		draw_text_transformed(_x + _letterAdderX, _y + _letterAdderY, _letter, scale, scale, 0);
		_x += string_width(_letter) * scale;
	}
	draw_set_colour(c_white);
}

