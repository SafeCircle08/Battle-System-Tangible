function attachToPlayerMovement(_xOffset = 0, _yOffset = 0) {
	if (instance_exists(oBattleManager)) {
		x = oSoul.x + _xOffset;
		y = oSoul.y + _yOffset;
		return;
	}
	x = oPlayerOW.x + _xOffset;
	y = oPlayerOW.y + _yOffset;
}