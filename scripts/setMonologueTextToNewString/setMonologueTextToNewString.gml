function setMonologueTextToNewString(_newString) {
	oBattleManager.writtenBattleText = _newString;
	oBattleManager.showingExtraMonologueText = true;
	resetTextVars();
}