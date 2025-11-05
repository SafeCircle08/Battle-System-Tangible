function setMonologueTextToNewString(_newString) {
	with (oBattleManager) {
		battleFlavourText = _newString;
		showingExtraMonologueText = true;
		resetTextVars();
	}
}