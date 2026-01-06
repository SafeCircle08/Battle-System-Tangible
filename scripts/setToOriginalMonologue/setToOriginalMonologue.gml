function setToOriginalBattleFlavourText(){
	with (oBattleFlavourTextManager.myTextInstance) {
		text = 	global.battleFlavourTexts[oBattleManager.flavourTextIndex];
		setToFirstPage();
	}
	
	with (oBattleManager) {
		showingExtraMonologueText = false;
	}
}