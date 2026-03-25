function drawTypeWriterText(_x, _y, _string, _lSep, _prop = 0.4, _color = c_white, scale = 1) {

    var charN = floor(charCount);
    var baseX = _x;
    var baseY = _y;

    draw_set_color(_color);

    for (var i = 1; i <= charN; i++) {

        var letter = string_char_at(_string, i);

        var letterAdderX = 0;
        var letterAdderY = 0;

        var seed = i + floor(current_time / 130);

        if (random(seed) < _prop) {
            letterAdderX = irandom_range(-1, 1);
            letterAdderY = irandom_range(-1, 1);
        }

		if (letter == "\n") {
            baseY += _lSep;
            _x = baseX;
            continue;
        }

        draw_text_transformed(_x + letterAdderX, baseY + letterAdderY, letter, scale, scale, 0);

        _x += string_width(letter);
    }

    draw_set_color(c_white);
}