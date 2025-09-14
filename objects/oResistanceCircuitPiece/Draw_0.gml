draw_self();
draw_set_font(fHungrySkinny);
var _w = sprite_get_width(sprite_index);
var _h = sprite_get_height(sprite_index);
var _border = 2;


if (hasTension) {
	draw_sprite_ext(sTensionIndicator, 0, x - 3, y + 3, 1, 1, image_angle, c_white, 1);
}

var _col;
if (ohmValue >= 1 && ohmValue < 4) {
	_col = make_white_yellow();
} else if (ohmValue >= 4 && ohmValue < 7) {
	_col = make_yellow_orange();
} else if (ohmValue >= 7) {
	_col = make_orange_red();
}
draw_set_color(_col);
var _ohmX = x + _border * 2 + 1;
var _ohmY = y + _h - 1;
if (hasTension) { _ohmY = y - _h - 7; }
draw_text_transformed(_ohmX, _ohmY, "R = " + string(ohmValue), 0.5, 0.5, 0);
draw_set_color(c_white);