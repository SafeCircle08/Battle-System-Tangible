function createEarthElectric(_x, _y, _angle = 0) {
	var _earth = instance_create_layer(_x, _y, LAYER_EXTRAS_OBJECTS, oEarthElectricPiece);
	_earth.image_angle = _angle;
}