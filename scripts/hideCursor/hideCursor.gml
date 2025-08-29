function hideCursor()
{
	if (!instance_exists(oCustomCursor)) { show_error("Object 'oCustomCursor' doesn't exist", true); }
	with (oCustomCursor) { cursorOn = false; visible = false; }
}