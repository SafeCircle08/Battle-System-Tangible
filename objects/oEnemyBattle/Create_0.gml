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