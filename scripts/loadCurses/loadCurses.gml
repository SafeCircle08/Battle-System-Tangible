function expireFood(_item) {
	var _expiredHp = _item.hp / 2;
	_item.hp = _item.hp - _expiredHp;
	_item.expired = true;
}

function loadCurses() {
	global.expiredFoodCurse = createEnchant(
		"Rotting", sExpiredFoodCurseProp, 
		function(_item) {  }, true, true,
		function(item) { expireFood(item); },
		function (item) { 
			print(item.hp);
			item.hp += item.hp;
			
			if (array_contains(item.enchants, global.expiredFoodCurse)) {
				item.expired = true;
			} else variable_struct_remove(item, "expired");
		}
	);
}