makingCursorMoving = false;
dropSound = sndLiquidDrop;

setUpCursorMovement = function() {
	makingCursorMoving = true;
}

makeCursorMove = function(_spd = 1.5) {
	oCustomCursor.image_speed = _spd;	
}