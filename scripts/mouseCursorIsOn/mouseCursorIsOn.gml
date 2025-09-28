function mouseCursorIsOn(_xPos, _yPos, _width, _height, _strictCheck = true)
{
	if (!_strictCheck) {
		return (mouse_x >= _xPos) && (mouse_x <= _width) &&
			   (mouse_y >= _yPos) && (mouse_y <= _height)
	} else {
		return (mouse_x > _xPos) && (mouse_x < _width) &&
			   (mouse_y > _yPos) && (mouse_y < _height)			
	}
}