function mouseIsTooFarWindow() {
	var _xToll = 45;
	var _yToll = 40;
	
	if (mouse_x < _xToll || mouse_x > room_width - _xToll) { return true; }
	if (mouse_y < _yToll || mouse_y > room_height - _yToll) { return true; }
	return false;
}