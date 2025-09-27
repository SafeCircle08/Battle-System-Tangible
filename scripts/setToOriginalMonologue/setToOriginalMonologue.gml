function setToOriginalMonologue(){
	with (oBattleManager) {
		showingExtraMonologueText = false;
		writtenBattleText = global.battleFlavourTexts[oBattleManager.flavourTextIndex];
		setToFirstPage();
	}
}