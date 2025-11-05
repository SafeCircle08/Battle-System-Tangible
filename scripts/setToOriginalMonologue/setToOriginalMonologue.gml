function setToOriginalBattleFlavourText(){
	with (oBattleManager) {
		showingExtraMonologueText = false;
		battleFlavourText = global.battleFlavourTexts[oBattleManager.flavourTextIndex];
		setToFirstPage();
	}
}