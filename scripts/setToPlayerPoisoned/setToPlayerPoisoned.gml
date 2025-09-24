function setPlayerToPoisoned(_poisonTagLV = 1) {
	var _poisonSeg;
	if (!instance_exists(oPoisonSegnalino)) {
		//If doesnt exit, it creates one
		_poisonSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_2, oPoisonSegnalino);
	} else {
		instance_destroy(oPoisonSegnalino);
		_poisonSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_2, oPoisonSegnalino);
	}
	//It always initializes it
	var _defaultMinPoisonDmg = 5;
	var _defaultMaxPoisonDmg = 15;
	var _defaultPoisonTimer = 250
	var _dafaultFreq = 150;
	_poisonSeg.poisonTimer = _defaultPoisonTimer * _poisonTagLV;
	_poisonSeg.poisonFreq = _dafaultFreq - (_poisonTagLV * 25);
	_poisonSeg.minPoisonDmg = _defaultMinPoisonDmg * 2 * _poisonTagLV;
	_poisonSeg.maxPoisonDmg = _defaultMaxPoisonDmg * 2 * _poisonTagLV;
}