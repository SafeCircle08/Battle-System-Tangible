global.enchantsById = ds_map_create();
global.enchantsInGame = [];
global.cursesInGame = [];

function createEnchant(_enchName, _spr, _func, _cursed = false, _desc = "") {
	var _newEnch = {
		name: _enchName,
		sprite: _spr,
		func: _func,
		desc: _desc,
		ench_id: _enchName,
		cursed: _cursed,
	}
	ds_map_add(global.enchantsById, _newEnch.ench_id, _newEnch);
	if (_cursed) { array_push(global.cursesInGame, _newEnch); }
	else { array_push(global.enchantsInGame, _newEnch); }
	return _newEnch;
}

loadEnchantmentsFunctions();
loadEnchantments();
loadCurses();