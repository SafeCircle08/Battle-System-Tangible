function addItemToInventory(_specificItem = undefined) {	
	if (cadAddToInventory()) {
		if (_specificItem != undefined) {
			array_push(global.equippedItems, _specificItem);	
		} else {
			var _inGameItemsNum = array_length(global.itemsInGame);
			var _index = irandom_range(0, _inGameItemsNum - 1);	
			array_push(global.equippedItems, global.itemsInGame[_index]);
			return ["*We left you a little surprise\n in your inventory!\n  -SYP-"]
		}
	}
	return ["*We tried to make you a gift,\n but there wasn't any\n space. -SYP-"]
}