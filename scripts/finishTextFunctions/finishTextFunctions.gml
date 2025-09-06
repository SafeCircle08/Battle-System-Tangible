function destroyTextBoxOW() {
	if (instance_exists(oPlayerOW)) {
		oPlayerOW.canMove = true;
	}
	instance_destroy();	
}

function stopTextBoxInputsShowEnemyText() {
	global.getTextBoxInputs = false;
	enemyCanShowText = true; 			
}