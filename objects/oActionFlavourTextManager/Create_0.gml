// Inherit the parent event
event_inherited();

text = oBattleManager.actionsFlavourText;
font = Mono;
character = false;
inBox = false;
inBattle = true;
sound = sndBasicTxt5;
isActionFlavourText = true;

canCreateText = function() {
	return (oBattleManager.showActionsFlavourText) && (!oBattleManager.isEnemySpeaking())	
}