function createHitSlashes(_slashesNumber = 2) {
	var _angleOffSet = irandom_range(0, 360);
	var _angleAdderSign = choose(-1, 1);
	for (var i = 0; i < _slashesNumber; i++) {
		var _angle = 45 - ((90 / _slashesNumber) * i + 1) + _angleOffSet;
		var _slash = instance_create_layer(oSoul.x, oSoul.y, LAYER_BULLETS, oPlayerHitSlashFX, 
			{ image_angle: _angle });
		_slash.angleAdderSign = _angleAdderSign;
	}
}