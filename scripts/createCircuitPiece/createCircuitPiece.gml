function createCircuitPiece(_x, _y, _w, _angle) {
	var _piece = instance_create_layer(_x, _y, LAYER_EXTRAS_OBJECTS, oCircuitPiece);
	_piece.image_xscale = _w;
	_piece.image_angle = _angle;
}