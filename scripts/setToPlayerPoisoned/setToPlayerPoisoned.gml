function setPlayerToPoisoned(_poisonTimer = 500, _poisonFreq = 100) {
	var _poisonSeg;
	if (!instance_exists(oPoisonSegnalino)) {
		//If doesnt exit, it creates one
		_poisonSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_2, oPoisonSegnalino);
	} else {
		//If it exists, if finds it
		_poisonSeg = instance_find(oPoisonSegnalino, 1);
	}
	//It always initializes it
	_poisonSeg.poisonTimer = _poisonTimer;
	_poisonSeg.poisonFreq = _poisonFreq;
}