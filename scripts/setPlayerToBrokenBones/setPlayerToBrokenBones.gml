function setPlayerToBrokenBones(_brokenBonesLV = SEGNALINO_LEVEL.LEVEL_1) {
	var _brokenBonesSeg;
	var _defaultTimer;
	
	if (!instance_exists(oBrokenBonesSegnalino)) {
		_brokenBonesSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_3, oBrokenBonesSegnalino);
	}	
	
	_brokenBonesSeg = instance_find(oBrokenBonesSegnalino, 0);
	
	_defaultTimer = 250;
	var _brokenBonesFreq = 70 - (_brokenBonesLV * 5);
	var _brokenBonesTimer = _defaultTimer + (30 * _brokenBonesLV);
	var _minBrokenBonesDmg = 2 + _brokenBonesLV * 5;
	var _maxBrokenBonesDmg = 5 + _brokenBonesLV * 10;
	
	assignValuesToSegnalino(
		_brokenBonesSeg, "BBones: ",
		SEGNALINO_TYPE.NERF,
		sBrokenBonesProperty,
		_minBrokenBonesDmg,
		_maxBrokenBonesDmg,
		_brokenBonesLV,
		_defaultTimer
	);
	_brokenBonesSeg.bonesFrequency = _brokenBonesFreq;
	
	initSegnalinoCard(_brokenBonesSeg);	
}