function setNewMonologueText(_newString) {
	with (oBattleFlavourTextManager.myTextInstance) {
		
		pagesList = [];
		
		if (is_array(_newString)) {
			for (var i = 0; i < array_length(_newString); i++) {
				pagesList[i] = addTextAsPage(_newString[0]);	
			}
		} else pagesList[0] = addTextAsPage(_newString);
		
		show_debug_message(pagesList);
		
		resetTextVars();
	}
	
	with (oBattleManager) {
		showingExtraMonologueText = true;
	}
}