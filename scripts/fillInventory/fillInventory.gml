function fillInventory(_specificItem = undefined) {
	for (var i = 0; i < MAX_ITEMS_NUM; i++) {
		if (_specificItem != undefined) {
			global.equippedItems[i] = _specificItem;
			continue;
		}
		var _index = irandom_range(0, array_length(global.itemsInGame) - 1);
		var _randomItem = global.itemsInGame[_index];
		global.equippedItems[i] = _randomItem;
	}
}