function createSplatClick(_x, _y, _sprite, _customFunc = void, _imageSpeed = 0) {
	if (instance_number(oCursorSplatObj) < MAX_SPLAT_OBJ_NUMBER)
	{
		var _splatFX = instance_create_layer(_x, _y, LAYER_EFFECT_TOP, oCursorSplatObj);
		_splatFX.setScaleVars(1, 1, 0, 0, 0, 0);
		_splatFX.setAlphaVars(1, 0, -0.005);
		_splatFX.setUpFadeOutTimer();
		_splatFX.customMethod = _customFunc;
		_splatFX.sprite_index = _sprite;
		_splatFX.image_speed = _imageSpeed
		_splatFX.image_angle = irandom_range(0, 360);
	}
}