function setPlayerToPoisoned(_poisonTagLV = 1) {
	var _poisonSeg;
	
	var _defaultMaxPoisonDmg;
	var _defaultMinPoisonDmg;
	var _defaultPoisonTimer;
	var _defaultFreq;
	
	if (!instance_exists(oPoisonSegnalino)) {
		//If doesnt exit, it creates one
		_poisonSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_2, oPoisonSegnalino);
	}
	
	_poisonSeg = instance_find(oPoisonSegnalino, 0);

	//It always initializes it
	_defaultMinPoisonDmg = 2;
	_defaultMaxPoisonDmg = 7;
	_defaultPoisonTimer = 130;
	_defaultFreq = 220;

	with (_poisonSeg) {
		poisonFreq = _defaultFreq - (_poisonTagLV * 25);	
		type = SEGNALINO_TYPE.DAMAGE;
		level = _poisonTagLV;
		segnalinoSprite = sPoisoningProperty;
		name = "Poison:";
		timer = _defaultPoisonTimer * _poisonTagLV;
		minValue = _defaultMinPoisonDmg * 2 * _poisonTagLV;
		maxValue = _defaultMaxPoisonDmg * 2 * _poisonTagLV;			
	}

	_poisonSeg.printSegnalinoInfos();
}