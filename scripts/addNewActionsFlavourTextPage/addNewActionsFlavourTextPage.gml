function addNewActionFlavourTextPage(_text, _finalChar = ".", _formatChar = "*") {
	array_push(oBattleManager.actionsFlavourText, addTextAsPage(_formatChar + _text + _finalChar));
}