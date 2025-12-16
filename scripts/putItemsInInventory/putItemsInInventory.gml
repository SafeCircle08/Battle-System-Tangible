function putItemsInInventory(n) {
	for (var i = 0; i < n; i++) {
		var _index = irandom_range(0, array_length(global.itemsInGame) - 1);
		var _randomItem = global.itemsInGame[_index];
		array_push(global.equippedItems, _randomItem);	
	}
	return; 
}
