global.enchantsById = ds_map_create();
global.enchantsInGame = [];
global.cursesInGame = [];

function createEnchant(_enchName, _spr, _func, _multiple = true, _cursed = false, _curseInstantFunc = function() {}, _removeCurseFunc = function() {}, _desc = "") {
	var _newEnch = {
		name: _enchName,
		sprite: _spr,
		func: _func,
		desc: _desc,
		ench_id: _enchName,
		cursed: _cursed,
		multiple: _multiple,
		curseInstantFunc: _curseInstantFunc,
		removeCurseFunc: _removeCurseFunc
	}
	ds_map_add(global.enchantsById, _newEnch.ench_id, _newEnch);
	if (_cursed) { array_push(global.cursesInGame, _newEnch); }
	else { array_push(global.enchantsInGame, _newEnch); }
	return _newEnch;
}

loadEnchantmentsFunctions();
loadEnchantments();
loadCurses();