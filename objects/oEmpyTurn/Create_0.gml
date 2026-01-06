event_inherited();
setPlayerInUseGravity(global.playerJumpStateMoveInfo.gravityRight);

/*setPlayerToBrokenBones(SEGNALINO_LEVEL.LEVEL_3);

setPlayerToSlowness(SEGNALINO_LEVEL.LEVEL_2);
*/

/*setPlayerToSlowness(SEGNALINO_LEVEL.LEVEL_5);
setPlayerToBrokenBones(SEGNALINO_LEVEL.LEVEL_5);
setPlayerToPoisoned(SEGNALINO_LEVEL.LEVEL_5);
*/

setPlayerToSlowness(SEGNALINO_LEVEL.LEVEL_5);
setPlayerToIceSlide(SEGNALINO_LEVEL.LEVEL_1);

initializeNewTurn(0, false, 200, 0, 220, 100, room_width / 2, room_height / 2 - 15, global.playerStateFree);
oSoul.image_alpha = 1;
oSoul.canMove = true;
oBattleBox.draw = true;

instance_create_layer(room_width / 2 - 50, room_height / 2, LAYER_BULLETS, oBulletTest);

var _x = getBattleBoxVertexX(BOX_VERTEXES.TOP_LEFT);
var _y = getBattleBoxVertexY(BOX_VERTEXES.TOP_LEFT);

instance_create_layer(_x + 20, _y + 20, LAYER_BULLETS, oHealTouch);

/*
instance_create_layer(global.boxOriginX, global.boxOriginY, "Instances", oPlatform);


var _rightDownCornerX = global.boxOriginX + (global.borderWidth / 2) - 10;
var _leftDownCornerX = global.boxOriginX - (global.borderWidth / 2) + 10;
var _rightDownCornerY = global.boxOriginY + (global.borderHeight / 2) - 10;
var _rightUpCornerY = global.boxOriginY - (global.borderHeight / 2) + 10;

var _leftUpCorner = [_leftDownCornerX, _rightUpCornerY];
var _rightUpCorner = [_rightDownCornerX, _rightUpCornerY];

var _leftDownCorner = [_leftDownCornerX, _rightDownCornerY];
var _rightDownCorner = [_rightDownCornerX, _rightDownCornerY];

//createBasicCircuit(_leftUpCorner, _rightUpCorner, _rightDownCorner, _leftDownCorner, 40);

createCircuitPiece(_rightDownCorner[0], _rightDownCorner[1], 20, -180);

createElectricLinkPosNeg(_rightDownCorner[0] - 20, _rightDownCorner[1], _rightDownCorner[0] - 160, _rightDownCorner[1], 180);
createCircuitPiece(_rightDownCorner[0] - 160, _rightDownCorner[1], global.borderWidth - 180, 180);

createCircuitPiece(_leftDownCorner[0], _leftDownCorner[1], global.borderHeight - 20, 090);
createCircuitPiece(_leftUpCorner[0], _leftUpCorner[1],  40, 0);
createCircuitResistance(_leftUpCorner[0] + 40, _leftUpCorner[1], 0);
createCircuitPiece(_leftDownCorner[0] + 76, _leftUpCorner[1], global.borderWidth - 76 - 20, 0);

//createElectricLinkPosNeg(_rightUpCorner[0], _rightUpCorner[1], _rightDownCorner[0], _rightDownCorner[1], -90);
createElectricLinkPosNeg(_rightDownCorner[0], _rightDownCorner[1], _rightUpCorner[0], _rightUpCorner[1] + 1, 90);

//createCircuitPiece(_rightUpCorner[0], _rightUpCorner[1],  global.borderHeight - 20, -90);
createCircuitPiece(global.boxOriginX, global.boxOriginY - (global.borderHeight / 2) + 10, 40, -90);
createCircuitPiece(global.boxOriginX, global.boxOriginY - 10, 80, 0);
createCircuitPiece(global.boxOriginX + 80, global.boxOriginY - 10, 50, -90);

createCircuitLaserPair(global.boxOriginX, global.boxOriginY, 120, 250, false);

setPlayerToSlowness(5);

//createCircuitLaserPair(100, 100, 0, 500);
//createCircuitLaserPair(50, 100, 0, 150, false);

/*createCircuitLaserPair(65, 100, 0, 180);


createCircuitLaserPair(180, 100, 0, 120, false);
createCircuitLaserPair(200, 120, -50, 165, false);
//createCircuitLaserPair(195, 100, 0, 300, false);

//createCircuitPiece(_leftDownCorner[0], _leftDownCorner[1], sqrt(((global.borderWidth - 20) * (global.borderWidth - 20)) + ((global.borderHeight - 20) * (global.borderHeight - 20))), 21.8);

/*
var _x = global.boxOriginX - 60;
var _y = global.boxOriginY + 30;

for (var i = 0; i < 4; i++)
{
	instance_create_layer(_x + (40 * i), _y, layer, oPlatform);	
}

function jumpDebugKeys()
{
	var state = global.playerStateGravity;
	if (keyboard_check_pressed(ord("Z"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityBasic;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
	if (keyboard_check_pressed(ord("X"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityUp;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
	if (keyboard_check_pressed(ord("C"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityLeft;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
	if (keyboard_check_pressed(ord("V"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityRight;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
}