function setPlayerToIceSlide(_iceSlideLV = SEGNALINO_LEVEL.LEVEL_1) {
	var _slideSeg;
	var _fricValue;
	var _defaultSlideTimer;
	
	if (!instance_exists(oIceSlideSegnalino)) {
		_slideSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_3, oIceSlideSegnalino);
	}
	
	_slideSeg = instance_find(oIceSlideSegnalino, 0);
	_defaultSlideTimer = 600;
	
	var _frics = [0.1, 0.05, 0.02, 0.01, 0.005];
	_fricValue = _frics[_iceSlideLV - 1];
	
	assignValuesToSegnalino(
		_slideSeg, "ISlide: ", 
		SEGNALINO_TYPE.NERF, 
		sFrozenProperty, 
		0,
		_iceSlideLV, 
		_iceSlideLV, 
		_defaultSlideTimer + (_iceSlideLV * 120)
	);
	oSoul.setToSlide(_fricValue);
	initSegnalinoCard(_slideSeg);
}