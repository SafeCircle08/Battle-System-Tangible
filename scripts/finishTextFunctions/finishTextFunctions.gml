function destroyTextBoxOW() {
	if (instance_exists(oPlayerOW)) {
		oPlayerOW.canMove = true;
	}
	instance_destroy();	
}

function showEnemyText() {
	resetTextVars();
	textFinishedTimer = 10;
	enemyCanShowText = true; 			
}