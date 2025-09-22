function setNewPreviousPlayerCoords(_newStartX, _newStartY) {
	with (oSoul) {
		startX = _newStartX;
		startY = _newStartY;
	}
}

function playerIsMoving() {
	if (oSoul.x != oSoul.startX || oSoul.y != oSoul.startY) {
		setNewPreviousPlayerCoords(oSoul.x, oSoul.y);
		return true;
	}	
	return false;
}