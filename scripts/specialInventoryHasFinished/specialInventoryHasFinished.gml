function specialInventoryHasFinished() {
	with (self) {
		return ((showingInv == false || canFadeInv == false) && oBattleManager.inventoryAlpha <= 0);	
	}
}