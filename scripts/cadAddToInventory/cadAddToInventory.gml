function cadAddToInventory() {
	if (array_length(global.equippedItems) + 1 <= MAX_ITEMS_NUM) { return true; }
	return false;
}