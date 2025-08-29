function showCursor()
{
	if (!instance_exists(oCustomCursor)) { show_error("Object 'oCustomCursor' doesn't exist", true); }
	with (oCustomCursor) { 
		cursorOn = true; 
		visible = true; 
		resetCursor(global.choosenCursor);
	}
}