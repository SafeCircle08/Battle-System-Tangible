function drawWaveyText(_x, _y, _string, _lSep, _color = c_white, _intensity = 200, amp = 1, scale = 1) {
	var _charN = floor(charCount);
	var _baseX = _x;
	var _baseY = _y;
	
	draw_set_colour(_color);
	for (var i = 1; i <= _charN; i++) {
		var letter = string_char_at(_string, i);
		var xOffset = cos(current_time / _intensity + i) * amp;
		var yOffset = sin(current_time / _intensity + i) * amp;
		if (letter == "\n") {
			_y += _lSep;
			_x = _baseX;
			continue;
		}
		
		draw_text_transformed(_x + xOffset, _y + yOffset, letter, scale, scale, 0);
		_x += string_width(letter);
	}
	draw_set_colour(c_white);
}
