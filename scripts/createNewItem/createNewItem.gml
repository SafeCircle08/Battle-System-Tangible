global.itemsInGame = [];
global.equippedItems = [];

function createNewItem(_name, spr, _hp, _outSound, propList, _info, fullHpTxt, outPutMsg, 
_method_1 = function() {}, _method_2 = function() {}, _method_3 = function() {}) {
	var item = {
		name: _name,
		sprite: spr,
		hp: _hp,
		outSound: _outSound,
		propertiesList: propList,
		info: _info,
		fullHPText: fullHpTxt,
		outPutMessage: outPutMsg,
		_itemFuncs: [
			_method_1,
			_method_2,
			_method_3
		],
		enchants: [],
		enchanted: false
	}
	array_push(global.itemsInGame, item);
	return item;
}