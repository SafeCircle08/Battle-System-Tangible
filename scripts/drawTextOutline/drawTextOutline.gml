function drawTextOutline(_string, _x, _y, _scale = 1, _txtCol = c_white, _outlineCol = c_black) {
	draw_set_colour(_outlineCol);
	
	draw_text_transformed(_x - _scale, _y, _string, _scale, _scale, 0);
	draw_text_transformed(_x + _scale, _y, _string, _scale, _scale, 0);	
	draw_text_transformed(_x, _y + _scale, _string, _scale, _scale, 0);
	draw_text_transformed(_x, _y - _scale, _string, _scale, _scale, 0);
	
	draw_set_colour(_txtCol);
	draw_text_transformed(_x, _y, _string, _scale, _scale, 0);
}