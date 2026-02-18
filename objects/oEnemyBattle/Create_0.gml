enemyVoiceSound = sndSteamPunkTalk;
enemyTxtBoxX = 183;
enemyTxtBoxY = 35;
enemySpeech = true;
inBox = true;
character = false;
isActionFlavourText = false;
inBattle = true;

myTextInstance = undefined;

enemyWillTalkAfterTurn = function() {
	return (oBattleManager.isEnemySpeaking() && (myTextInstance == undefined) && (oBattleManager.enemyWillTalkAfterBulletHellSection));	
}

enemyWillNotTalkAfterTurn = function() {
	return (oBattleManager.isEnemySpeaking() && (myTextInstance == undefined) && (oBattleManager.enemyWillTalkAfterBulletHellSection == false));		
}

createEnemyTextAfterPlayerAction = function() {
	myTextInstance = instance_create_layer(x, y, "Instances", oTextInstance);
	myTextInstance.text = getTextPage();
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

createEnemyTextAfterBulletHellSection = function() {
	//code goes here	
}

getTextPage = function() {
	return global.textList[oBattleManager.turnNumber].text;	
}