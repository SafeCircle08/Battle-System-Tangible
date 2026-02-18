if (oBattleManager.isEnemySpeaking() == false) {
	if (instance_exists(myTextInstance)) { 
		instance_destroy(myTextInstance); 
	}
	myTextInstance = undefined;
}

if (oBattleManager.isEnemySpeaking() && (myTextInstance == undefined)) createEnemyTextAfterPlayerAction();