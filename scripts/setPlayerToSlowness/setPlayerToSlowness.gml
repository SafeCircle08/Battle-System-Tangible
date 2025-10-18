function setPlayerToSlowness(_slownessTagLV = SEGNALINO_LEVEL.LEVEL_1) {
	var _slowSeg;
	var _defaultSlownessValue;
	var _defaultSlownessTimer;
	if (!instance_exists(oSlownessSegnalino)) {
		_slowSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_3, oSlownessSegnalino);
	}
	
	_slowSeg = instance_find(oSlownessSegnalino, 0);
	
	_defaultSlownessValue = 0.20;
	_defaultSlownessTimer = 500;
	_slowSeg.slownessAmount = _defaultSlownessValue * _slownessTagLV;
	
	assignValuesToSegnalino(
		_slowSeg, "S.ness: ", 
		SEGNALINO_TYPE.NERF, 
		sSlownessProperty, 
		DEFAULT_SOUL_SPD - _slowSeg.slownessAmount,
		DEFAULT_SOUL_SPD, 
		_slownessTagLV, 
		_defaultSlownessTimer * _slownessTagLV
	);
}