function destroyTextBoxOW() {
	if (instance_exists(oPlayerOW)) {
		oPlayerOW.enableMovement();
	}
	instance_create_layer(room_width / 2, room_height / 2, "Instances", oFadingOutTxtBoxFX);
	instance_destroy();	
}


function showEnemyText() {
	resetTextVars();
	textFinishedTimer = 10;
	enemyCanShowText = true; 			
}