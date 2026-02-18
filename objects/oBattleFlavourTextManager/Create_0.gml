// Inherit the parent event
event_inherited();

text = oBattleManager.battleFlavourText;
font = Mono;
character = false;
inBox = false;
inBattle = true;
isActionFlavourText = false;
sound = sndBasicTxt5;

canCreateText = function() {
	return (!oBattleManager.showActionsFlavourText) && (!oBattleManager.isEnemySpeaking());
}