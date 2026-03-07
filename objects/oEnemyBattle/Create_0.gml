enemyVoiceSound = sndSteamPunkTalk;
enemyTxtBoxX = 183;
enemyTxtBoxY = 35;
enemySpeech = true;
inBox = true;
character = false;
isActionFlavourText = false;
inBattle = true;
myTextInstance = undefined;

pagesList = [];

getPagesList = function() {
	return global.textList[oBattleManager.turnNumber];	
}

createBasicEnemyText = function(_pageList = getPagesList()) {
	myTextInstance = instance_create_layer(x, y, "Instances", oTextInstance);
	
	myTextInstance.pagesList = _pageList;

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
	createBasicEnemyText([addAsPage("Testing after\nbullet hell\nsection text!"), addAsPage("I fucking love\npizza")]);
	myTextInstance.enemyAfterTurnText = true;
}

