function cursorDisableFX(){
	var _cursor = global.choosenCursor;
	if (_cursor.enableFX == true) {
		_cursor.enableFX = false;	
	}
	return;
}