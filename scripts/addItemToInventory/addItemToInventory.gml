function addItemToInventory(_specificItem = undefined, _playSound = false) {	
	if (cadAddToInventory()) {
		if (_playSound) playSoundNotPlaying(sndAddItemToInv, SOUND_CHANNEL_4);
		if (_specificItem != undefined) {
			array_push(global.equippedItems, _specificItem);	
		} else {
			var _inGameItemsNum = array_length(global.itemsInGame);
			var _index = irandom_range(0, _inGameItemsNum - 1);	
			array_push(global.equippedItems, global.itemsInGame[_index]);
			return ["*We left you a little gift\n in your inventory!\n  -SYP-"]
		}
	}
	return ["*We tried to make you a gift,\n but there wasn't any\n space. -SYP-"]
}