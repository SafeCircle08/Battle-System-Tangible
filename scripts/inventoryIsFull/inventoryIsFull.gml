function inventoryIsFull() {
	return (array_length(global.equippedItems) == MAX_ITEMS_NUM);
}