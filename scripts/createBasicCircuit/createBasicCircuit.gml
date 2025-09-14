#macro VERTEX_X 0
#macro VERTEX_Y 1
#macro CIRCUIT_PIECE_BOX_DISTANCE 10

function createBasicCircuit(_lU, _rU, _rD, _lD, _startPieceW) {
	createCircuitPiece(_lU[VERTEX_X], _lU[VERTEX_Y], global.borderWidth - CIRCUIT_PIECE_BOX_DISTANCE * 2, 0);
	createCircuitPiece(_rU[VERTEX_X], _rU[VERTEX_Y], global.borderHeight - CIRCUIT_PIECE_BOX_DISTANCE * 2, -90);
	createCircuitPiece(_rD[VERTEX_X], _rD[VERTEX_Y], global.borderWidth - CIRCUIT_PIECE_BOX_DISTANCE * 2, -180);
	createCircuitPiece(_lD[VERTEX_X], _lD[VERTEX_Y], global.borderHeight - CIRCUIT_PIECE_BOX_DISTANCE * 2, -270);
	createCircuitPiece(global.boxOriginX, global.boxOriginY - (global.borderHeight / 2) + CIRCUIT_PIECE_BOX_DISTANCE, _startPieceW, -90);
	createEarthElectric(global.boxOriginX, global.boxOriginY - (global.borderHeight / 2) + CIRCUIT_PIECE_BOX_DISTANCE + _startPieceW);
}