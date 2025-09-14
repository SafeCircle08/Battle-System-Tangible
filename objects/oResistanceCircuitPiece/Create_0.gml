// Inherit the parent event
event_inherited();

hasTension = true;

if (hasTension) { image_blend = c_orange; }

maxOhmValue = 9;
ohmValue = 1;

#region COLOR FUNCTIONS
make_white_yellow = function() {
	var _red = 255;
	var _green = 255;
	var _blue = 255 - (255 / 2) * (ohmValue - 1);
	var _col = make_color_rgb(_red, _green, _blue);
	return _col;
}

make_yellow_orange = function() {
	var _red = 255;
	var _green = 255 - (30 * (ohmValue - 3));
	var _blue = 0;
	var _col = make_color_rgb(_red, _green, _blue);
	return _col;	
}

make_orange_red = function() {
	var _red = 255;
	var _green = 165 - (55 * (ohmValue - 6));
	var _blue = 0;
	var _col = make_color_rgb(_red, _green, _blue);
	return _col;		
}
#endregion

clampValues = function() {
	ohmValue = clamp(ohmValue, 1, maxOhmValue);
}

if (ohmValue >= 10) {
	ohmValue = 	maxOhmValue;
}