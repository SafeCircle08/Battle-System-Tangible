function changeCursorImg(_invert = true, _newIndex = 0) {
	with (oCustomCursor)
	{
		if (_invert) {
			image_index = !image_index;	
			return;
		}
		_newIndex = irandom_range(0, image_number - 1);
		image_index = _newIndex;			
	}
}