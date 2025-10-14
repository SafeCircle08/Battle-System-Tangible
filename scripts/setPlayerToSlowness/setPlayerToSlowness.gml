function setPlayerToSlowness(_slownessTagLV = 1) {
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
	
	with (_slowSeg) {
		_slowSeg.name = "S.ness:";
		_slowSeg.type = SEGNALINO_TYPE.NERF;
		_slowSeg.segnalinoSprite = sSlownessProperty;
		_slowSeg.minValue = DEFAULT_SOUL_SPD - _slowSeg.slownessAmount;
		_slowSeg.maxValue = DEFAULT_SOUL_SPD;
		_slowSeg.level = _slownessTagLV;
		_slowSeg.timer = _defaultSlownessTimer * _slownessTagLV;
	}
	_slowSeg.printSegnalinoInfos();
}