function destroyTextBoxOW(_x = room_width / 2, _y = room_height / 2, _makeFx = true) {
	if (instance_exists(oPlayerOW)) { oPlayerOW.enableMovement(); }
	if (_makeFx) instance_create_layer(_x, _y, "Instances", oFadingOutTxtBoxFX);
	instance_destroy();	
}

function showEnemyText() {
	resetTextVars();
	textFinishedTimer = 10;
	oBattleManager.setToEnemySpeaking();
}