function setToDarkSegnalino(_darkTimer = 1000) {
	var _darkSeg;
	if (!instance_exists(oDarkSegnalino)) {
		_darkSeg = instance_create_layer(0, 0, LAYER_EFFECT_TOP_3, oDarkSegnalino);	
	} 
	_darkSeg.darkTimer = _darkTimer;
}