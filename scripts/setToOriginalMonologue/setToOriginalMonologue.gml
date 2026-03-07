function setToOriginalBattleFlavourText(){
	with (oBattleFlavourTextManager.myTextInstance) {
		pagesList = global.battleFlavourTexts[oBattleManager.flavourTextIndex];
		setToFirstPage();
	}
	
	with (oBattleManager) {
		showingExtraMonologueText = false;
	}
}