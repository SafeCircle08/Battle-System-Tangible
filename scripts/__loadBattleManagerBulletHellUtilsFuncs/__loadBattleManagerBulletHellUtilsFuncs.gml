function __loadBattleManagerBulletHellUtilsFuncs(){
	goToBulletHellSection = function() {
		setToEnemyFinishedSpeaking();
		oBattleBox.visible = true;
		oBulletGeneratorManager.createGenerator();
	}
	isInBulletHellSection = function() { 
		return (oBattleBox.visible) && (global.enemyAttackTime > 0); 
	}
}