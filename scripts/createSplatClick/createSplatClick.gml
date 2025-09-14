function createCursorFX
(
	_x,
	_y,
	_sprite, 
	_customFunc = void, 
	_imageSpeed = 0, 
	_randomAngle = true,
	startXScale = 1,
	startYScale = 1,
	finalXScale = 0,
	finalYScale = 0,
	scaleSign = 1,
	scaleAmount = 0.05,
	startAlpha = 1,
	finalAlpha = 0,
	alphaSign = 1,
	alphaAmount = 0.05
) 
{
	if (global.choosenCursor.enableFX == false) { return; }
	if (instance_number(oCursorSplatObj) < MAX_SPLAT_OBJ_NUMBER) {
		var _splatFX = instance_create_layer(_x, _y, LAYER_EFFECT_TOP, oCursorSplatObj);
		
		_splatFX.setScaleVars(
			startXScale, 
			startYScale, 
			finalXScale,
			finalYScale,
			scaleAmount
		);
		
		_splatFX.setAlphaVars(
			startAlpha, 
			finalAlpha, 
			alphaAmount
		);
		
		_splatFX.setUpFadeOutTimer();
		_splatFX.customMethod = _customFunc;
		_splatFX.sprite_index = _sprite;
		_splatFX.image_speed = _imageSpeed;
		if (_randomAngle) { _splatFX.image_angle = irandom_range(0, 360); }	
	}
}