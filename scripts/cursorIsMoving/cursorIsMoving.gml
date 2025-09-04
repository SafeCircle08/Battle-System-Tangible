function cursorIsMoving(_cursor, _checkForFrames = false, _frameCheckAmount = 30) {
	with (oCustomCursor) {
		if ((mouse_x != startCursorX) || (mouse_y != startCursorY))
		{
			setNewCursorStartCoords();
			if (_checkForFrames == false) { return true; }
			
			framesSpentMoving++;
			if (framesSpentMoving % _frameCheckAmount == 0) {
				resetSpentMovingTimer();
				return true;	
			}
		} else { resetSpentMovingTimer(); }
		return false;
	}
}