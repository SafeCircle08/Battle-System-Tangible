function setPlayerToSlowness(_slownessTagLV = 1) {
	var _slowSeg;
	
	if (!instance_exists(oSlownessSegnalino)) {
		_slowSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_3, oSlownessSegnalino);	
	}  else {
		instance_destroy(oSlownessSegnalino);
		_slowSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_3, oSlownessSegnalino);	
	}
	var _defaultSlownessValue = 0.20;
	var _defaultSlownessTimer = 500;
	_slowSeg.slownessLV = _slownessTagLV;
	_slowSeg.slownessAmount = _defaultSlownessValue * _slownessTagLV;
	_slowSeg.slownessTimer = _defaultSlownessTimer * _slownessTagLV;
	_slowSeg.slownedSpd = DEFAULT_SOUL_SPD - _slowSeg.slownessAmount;
	_slowSeg.printInfo();
}