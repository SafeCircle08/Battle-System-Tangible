function playerFullHpAfterConsumingItem(_item) {
	var _addedHps = _item.hp;
	
	switch (_item.hpType) {
		case ITEM_HP_TYPE.NORMAL: return (global.playerHP + _addedHps >= global.playerMAX_HP);	
		case ITEM_HP_TYPE.DOUBLE: return (global.playerHP + _addedHps * 2 >= global.playerMAX_HP);
		case ITEM_HP_TYPE.HALF: return (global.playerHP + floor(_addedHps / 2) >= global.playerMAX_HP);	
	}
}