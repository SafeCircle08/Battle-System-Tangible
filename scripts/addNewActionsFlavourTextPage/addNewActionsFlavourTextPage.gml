function addNewActionFlavourTextPage(_newMsg, _finalChar = ".", _formatChar = "*") {
	array_push(oBattleManager.actionsFlavourText, _formatChar + _newMsg + _finalChar);
}