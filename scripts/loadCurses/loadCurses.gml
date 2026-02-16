function expireFood(_item) {
	var _expiredHp = _item.hp / 2;
	_item.hp = floor(_item.hp - _expiredHp);
	_item.expired = true;
}

function loadCurses() {
	global.expiredFoodCurse = createEnchant(
		"Rotting", sExpiredFoodCurseProp, 
		function(_item) {  }, true,
		function(item) { expireFood(item); });
}