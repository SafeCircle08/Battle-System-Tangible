function manageSpecialInventory(_getInputs, _canNavigate, _funcWhenClick = function() {}) {	
	with (self) {
		if (showingInv) {
			if (canFadeInv) oBattleManager.inventoryFadeIn();
			else oBattleManager.inventoryFadeOut();
			oBattleManager.navigatingInventoryFunction(_getInputs, _canNavigate);
			
			if (confirmPressed(false)) _funcWhenClick();
			
		} else oBattleManager.inventoryFadeOut();
	} 
}