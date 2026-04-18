manageSpecialInventory(DONT_GET_INPUTS, canNavigateInv);

if (finished == false) {
	if (confirmPressed(true) && dispelling == false) selecteItem();

	if (dispelling) {
		if (cancelPressed()) unselectItem();
		subIndex = navigate(subIndex, sndNavigating_2, 0, 2);
	
		dispelDelay = setTimer(dispelDelay);
		if (dispelDelay == 0 && canDispel(subIndex)) {
			oDispelIndicator.rotate();
			if (confirmPressed(false)) dispelItem();
		} else { 
			if (instance_exists(oDispelIndicator)) oDispelIndicator.normal();
		}
	}
}

if (specialInventoryHasFinished()) {
	instance_destroy(self);
	print("distrutto");
}