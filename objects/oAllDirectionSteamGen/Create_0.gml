event_inherited();

//NUMERO DI TUBI CHE SI VUOLE NEL TURNO
numberOfTubesWidth = 12;
numberOfTubesHeight = 5;
width = sprite_get_width(sTubeSteam);
height = sprite_get_height(sTubeSteam);

timerGetCoord = 50;

initializeNewTurn(
	50, false, 800, 0, 
	(sprite_get_width(sTubeSteam) * numberOfTubesWidth), 
	(sprite_get_width(sTubeSteam) * numberOfTubesHeight), 
	room_width / 2, room_height / 2 - 10, 
	global.playerStateFree
);