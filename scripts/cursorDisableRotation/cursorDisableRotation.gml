function cursorDisableRotation() {
	var _cursor = global.choosenCursor;
	if (_cursor.enableRotation == true) { 
		_cursor.enableRotation = false;
		oCustomCursor.setUpCursorVars();
	}
}