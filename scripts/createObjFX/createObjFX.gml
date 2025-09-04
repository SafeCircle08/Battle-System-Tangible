function createObjFX
(
	_spr, 
	_timer = 10,
	_imgSpd = 1, 
	startXScale = 1, 
	startYScale = 1,
	finalXScale = 0,
	finalYScale = 0,
	scaleSign = 1,
	scaleAmount = 0.05,
	startAlpha = 1,
	finalAlpha = 1,
	alphaSign = 1,
	alphaAmount = 0,
) {
	with (oCustomCursor) {
		var _fx = instance_create_layer(x, y, LAYER_EFFECT_TOP, oChangeAlphaDimObjFX);
		_fx.sprite_index = _spr;
		_fx.image_speed = _imgSpd;
		_fx.frame = _timer;
		_fx.setUpVars
		(
			startXScale, 
			startYScale, 
			finalXScale, 
			finalYScale, 
			scaleSign, 
			scaleAmount, 
			startAlpha, 
			finalAlpha, 
			alphaSign, 
			alphaAmount
		);
	}
}