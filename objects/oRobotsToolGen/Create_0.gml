event_inherited();
initializeNewTurn(60, false, 850, 0, 270, 35, 160, (room_width / 2) + 40, global.playerStateFree);

// VADO A DESTRA
robotRight = 
[
	oToolBoxGenerator,
	40,
	room_height / 2 - 90,
	[-1.5, +1.5],
	false, //goingLeft
];

//VADO A SINISTRA
robotLeft = 
[
	oToolBoxGenerator,
	room_width - 40,
	room_height / 2 - 90,
	[-1, +1],
	true, //goingLeft
];

robots = [robotLeft, robotRight];
robotSpeeds = noone;