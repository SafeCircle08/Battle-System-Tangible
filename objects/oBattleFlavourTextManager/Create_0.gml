text = undefined;
font = Mono;
character = false;
inBox = true;
inBattle = true;
isBattleFlavourText = true;

myTextInstance = undefined;

canCreateText = function() {
	return (!oBattleManager.showActionsFlavourText)
}

drawBattleFlavourText = function() {
	drawTextBoxText(
		text, 
		Mono, 
		false,
		false,
		true, 
		true
	);	
}