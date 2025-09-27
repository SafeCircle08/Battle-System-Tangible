event_inherited();
initializeNewTurn(50, false, 1300, false, 260, 100, room_width / 2, room_height / 2, global.playerStateFree);

mer = 100;

cannonHorizotal = instance_create_layer(x, y, LAYER_BULLETS, oBlasterLineGenerator);
setLineBlasterPos
(
	cannonHorizotal,
	[-200, -200],
	[global.boxOriginY + 35, global.boxOriginY - 35],
	[50, 50],
	[global.boxOriginY + 35, global.boxOriginY - 35],
	"horizontal",
	1
);
instance_create_layer(10, 187, LAYER_BULLETS, oRectangleIndicator);
instance_create_layer(10, 125, LAYER_BULLETS, oSupportPlayerHitBox_2);