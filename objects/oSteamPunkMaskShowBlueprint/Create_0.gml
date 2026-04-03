event_inherited();

showingTimer = 0;
myBlueprint = noone;

finishedShowing = false;
MIN_ALPHA = 0.4;
MASK_ALPHA_ADDER = 0.05;
secondsN = 4;

maskShowingBlueprint = function() {
	if (image_alpha > MIN_ALPHA) image_alpha -= MASK_ALPHA_ADDER;
	if (myBlueprint == noone) myBlueprint = instance_create_layer(x, y, LAYER_BATTLE_BOX, oSteamPunkMask_Blueprint);
	showingTimer++;
}

canSetOnBlueprint = function() {
	return (maskReady == true && maskOnBlueprint == false && finishedShowing == false);	
}

initializeNewTurn(0, false, secondsN * GAME_FPS + 460, 0, 50, 35, BATTLE_BOX_BASE_X, BATTLE_BOX_BASE_Y + 8, global.playerStateFree);
setBlackBattleBgToNewAlpha(0.90);