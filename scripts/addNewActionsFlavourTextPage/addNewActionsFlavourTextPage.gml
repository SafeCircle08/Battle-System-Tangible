function addNewActionFlavourTextPage(_text, _finalChar = ".", _formatChar = "*") {
	array_push(oBattleManager.actionsFlavourText, addAsPage(_formatChar + _text + _finalChar));
}