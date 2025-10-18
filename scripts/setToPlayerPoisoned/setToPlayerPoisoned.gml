function setPlayerToPoisoned(_poisonTagLV = SEGNALINO_LEVEL.LEVEL_1) {
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
	_defaultPoisonTimer = 550;
	_defaultFreq = 220;


	assignValuesToSegnalino(_poisonSeg, 
		"Poison: ",
		SEGNALINO_TYPE.DAMAGE,
		sPoisoningProperty,
		_defaultMinPoisonDmg * 2 * _poisonTagLV, 
		_defaultMaxPoisonDmg * 2 * _poisonTagLV,
		_poisonTagLV,
		_defaultPoisonTimer * _poisonTagLV
	);
}