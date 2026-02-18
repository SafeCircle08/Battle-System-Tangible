function __loadBattleManagerEnemyUtilsFuncs(){
	isEnemySpeaking = function(){
		return (enemyCanShowText) &&
			   (enemyTextShowed == false)	
	}
	setToEnemySpeaking = function() {
		showActionsFlavourText = false;
		enemyCanShowText = true;
		enemyTextShowed = false;
	}
	resetEnemySpeakingVars = function() {
	enemyTextShowed = false;
	enemyCanShowText = false;
	}	
	setToEnemyFinishedSpeaking = function() {
		enemyTextShowed = true;
		enemyCanShowText = false;
	}
	setToEnemySpeakingAfterBulletHell = function() {
		setToEnemySpeaking();
		oEnemyBattle.createEnemyTextAfterBulletHellSection();
	}
	increaseEnemyTurnTimer = function() {
		global.enemyTimer++;	
	}
	changeTurnAfterEnemySpeech = function() {
		setToEnemyFinishedSpeaking();
		changeTurn();
	}
	enemyTimerEnded = function() {
		return (global.enemyTimer >= global.enemyAttackTime);	
	}
}