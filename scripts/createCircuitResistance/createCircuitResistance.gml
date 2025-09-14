function createCircuitResistance(_x, _y, _angle) {
	var _piece = instance_create_layer(_x, _y, LAYER_EXTRAS_OBJECTS, oResistanceCircuitPiece);
	_piece.image_angle = _angle;
}	
