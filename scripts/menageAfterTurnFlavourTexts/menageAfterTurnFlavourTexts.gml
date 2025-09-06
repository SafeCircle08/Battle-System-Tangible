function menageAfterTurnFlavourTexts() {
	//all the different texts that can appear
	var _flavourTexts = [flavourPlayerHurt, shieldDestroyed];
	
	var _l = array_length(_flavourTexts);
	var _stringsToAdd = _flavourTexts[irandom_range(0, _l - 1)]();
	var _refString = flavourText;
	with (oBattleManager) {
		for (var i = 0; i < array_length(_stringsToAdd); i++) {
			var _actualString = _stringsToAdd[i];
			_refString = addStringToArray(_refString, _actualString);
		}
	}
	return _refString;
}