if (oBattleManager.isEnemySpeaking() == false) {
	if (instance_exists(myTextInstance)) { instance_destroy(myTextInstance); }
	myTextInstance = undefined;
}

if (oBattleManager.isEnemySpeaking() && (myTextInstance == undefined)) {
	myTextInstance = instance_create_layer(x, y, "Instances", oTextInstance);
	myTextInstance.text = getTextPage();
	myTextInstance.font = fHungrySkinny;
	myTextInstance.character = false;
	myTextInstance.isActionsFlavourText = false;
	myTextInstance.inBox = true;
	myTextInstance.inBattle = true;
	myTextInstance.sound = enemyVoiceSound;
	myTextInstance.enemySpeech = true;
	myTextInstance.txtX = enemyTxtBoxX;
	myTextInstance.txtY = enemyTxtBoxY;
}