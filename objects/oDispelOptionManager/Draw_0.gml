if (showingInv == false) exit;

draw_set_font(fMonoNotMono);

var _txtX = INVENTORY_X + 89;
var _txtY = INVENTORY_Y - 21;
var _str = string(dispelsLeft) + "/3";
var _col = c_white;

draw_set_colour(c_black);
draw_text(_txtX + 1, _txtY, _str);

if (dispelsLeft == 2) _col = c_orange;

if (dispelsLeft == 1) {
	drawShakyText(_txtX, _txtY, _str, 7, c_red, 1.0, true);
	exit;
}

draw_set_colour(_col);
draw_text(_txtX, _txtY, _str);