enemyVoiceSound = sndSteamPunkTalk;
enemyTxtBoxX = 183;
enemyTxtBoxY = 35;
enemySpeech = true;
inBox = true;
character = false;
isActionFlavourText = false;
inBattle = true;
myTextInstance = undefined;

createBasicEnemyText = function(_text = getTextPage()) {
	myTextInstance = instance_create_layer(x, y, "Instances", oTextInstance);
	myTextInstance.text = _text;
	myTextInstance.font = fHungrySkinny;
	myTextInstance.character = false;
	myTextInstance.isActionsFlavourText = false;
	myTextInstance.inBox = false;
	myTextInstance.inBattle = true;
	myTextInstance.sound = enemyVoiceSound;
	myTextInstance.enemySpeech = true;
	myTextInstance.txtX = enemyTxtBoxX;
	myTextInstance.txtY = enemyTxtBoxY;		
}

createEnemyTextAfterPlayerAction = function() { createBasicEnemyText(); }

createEnemyTextAfterBulletHellSection = function() {
	createBasicEnemyText(["Testing after\nbullet hell\nsection text!"]);
	myTextInstance.enemyAfterTurnText = true;
}

getTextPage = function() {
	return global.textList[oBattleManager.turnNumber].text;	
}