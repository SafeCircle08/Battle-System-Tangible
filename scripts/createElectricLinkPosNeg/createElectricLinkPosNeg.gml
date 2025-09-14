function createElectricLinkPosNeg(_positiveX, _positiveY, _negativeX, _negativeY, _positiveAngle, _turnedOn = true) {
	var _layer = LAYER_EXTRAS_OBJECTS;
	var _negativeAnion = instance_create_layer(_negativeX, _negativeY - 1, _layer, oNegativePole);
	_negativeAnion.image_angle = _positiveAngle - 180;
	var _positiveCat = instance_create_layer(_positiveX, _positiveY, _layer, oPositivePole);
	_positiveCat.image_angle = _positiveAngle;
	if (_turnedOn) { 
		_positiveCat.createElectricLink(_negativeAnion); 
		return;
	}
	_negativeAnion.image_index = 1;	
	_positiveCat.image_index = 1;	
}