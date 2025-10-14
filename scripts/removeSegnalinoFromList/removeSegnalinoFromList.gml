function removeSegnalinoFromList(_segInst) {
	var _found = false;
	var _index;
	
	for (var i = 0; i < array_length(oSegnaliniOnPlayerManager.segnaliniOnPlayer); i++) {
		if (oSegnaliniOnPlayerManager.segnaliniOnPlayer[i] == _segInst) {
			_found = true;
			_index = 1;
			break;
		}
	}
	
	if (_found) {
		array_delete(oSegnaliniOnPlayerManager.segnaliniOnPlayer, _index, 1);
		return;
	}
	
	show_error("Segnalino doesn't exit.", false);
	
}