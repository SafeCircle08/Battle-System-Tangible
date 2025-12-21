amplitude = 0;
timerValue = 0;
frequence = 0;
startImageAlpha = noone;
frame = 1;
sining = true;
attached = false;
caller = 0;
alphaFrequency = 0.01;

battleGUIFunction = function() {
	var _height = sprite_get_height(sGUI_BackGround_ORANGE) * image_yscale;
	x = oBattleManager.startButtonX	+ cos(timerValue) * amplitude + 45;
	y = room_height / 4 + (_height) - 10;
}