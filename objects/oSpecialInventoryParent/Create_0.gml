showingInv = false;
canFadeInv = true;

openSpecialInventory = function() {
	showingInv = true;
	canFadeInv = true;
	showCursor();
}

closeSpecialInventory = function() {
	canFadeInv = false;
	showingInv = false;
	hideCursor();
}
