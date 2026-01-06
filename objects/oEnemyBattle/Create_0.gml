enemyVoiceSound = sndSteamPunkTalk;
enemyTxtBoxX = 183;
enemyTxtBoxY = 35;
enemySpeech = true;
inBox = true;
character = false;
isActionFlavourText = false;
inBattle = true;

myTextInstance = undefined;

getTextPage = function() {
	return global.textList[oBattleManager.turnNumber].text;	
}

drawEnemyText = function() {
	var _page = getTextPage();
	drawTextBoxText(
		_page,
		fHungrySkinny,
		character,
		isActionFlavourText,
		inBox,
		inBattle,
		enemyVoiceSound,
		enemySpeech,
		enemyTxtBoxX, enemyTxtBoxY
	);		
}