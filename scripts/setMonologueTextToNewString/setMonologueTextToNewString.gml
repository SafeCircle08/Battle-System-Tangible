function setMonologueTextToNewString(_newString) {
	with (oBattleFlavourTextManager.myTextInstance) {
		text = _newString;
		resetTextVars();
	}
	
	with (oBattleManager) {
		showingExtraMonologueText = true;
	}
}