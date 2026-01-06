text = undefined;
font = Mono;
character = false;
inBox = true;
inBattle = true;
isBattleFlavourText = false;

myTextInstance = undefined;

canCreateText = function() {
	return (oBattleManager.showActionsFlavourText) && (!oBattleManager.isEnemySpeaking())
}




drawActionFlavourText = function() {
	drawTextBoxText(
		text, 
		font, 
		character, 
		false,
		inBox, 
		inBattle, 
	);	
}

