function cursorDisableSounds(){
	var _cursor = global.choosenCursor;
	if (_cursor.enableSounds == true) {
		_cursor.enableSounds = false;
	}
	return;
}