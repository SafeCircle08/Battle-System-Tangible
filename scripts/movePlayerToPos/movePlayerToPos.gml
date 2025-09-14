function movePlayerToPos(_newX, _newY) {
	if (instance_exists(oBattleManager)) {
		oSoul.x = _newX;
		oSoul.y = _newY;
		oSoul.visible = true;
	} else {
		oPlayerOW.x = _newX;
		oPlayerOW.y = _newY;
		oPlayerOW.visible = true;
	}
}