function expireFood(_item) { 
	var _hpToRemove;
	switch (_item.hpType) {
		case ITEM_HP_TYPE.NORMAL: _hpToRemove = ceil(_item.hp / 2); break;
		case ITEM_HP_TYPE.DOUBLE: _hpToRemove = _item.hp; break;
		case ITEM_HP_TYPE.HALF: _hpToRemove = ceil(_item.hp / 4); break;
	}
	show_debug_message(global.playerHP);
	hitPlayer(_hpToRemove);
}

function loadCurses() {
	global.expiredFoodCurse = createEnchant("Rotting", sExpiredFoodCurseProp, function(_item) { expireFood(_item); }, true);
}