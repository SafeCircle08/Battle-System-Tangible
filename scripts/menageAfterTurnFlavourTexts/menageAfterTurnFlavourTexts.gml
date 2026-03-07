function menageAfterTurnFlavourTexts(_prop1 = 1, _prop2 = 7) {
	var _winN = 5;
	var _n = irandom_range(_prop1, _prop2)
	if !(_n == _winN) return;
	
	var _flavourTexts = [flavourPlayerHurt, shieldDestroyed];
	var _index = arrayGetValidIndex(_flavourTexts);
	var _strings = _flavourTexts[_index]();
	
	var _pagesToAdd = stringArrayToPagesArray(_strings);
	
	with (oBattleManager) {
		for (var i = 0; i < array_length(_pagesToAdd); i++) 
			array_push(actionsFlavourText, _pagesToAdd[i]);
	}
}