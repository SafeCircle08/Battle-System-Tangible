global.itemsNumber = 0;
global.itemsInGame = [];
global.equippedItems = [];
global.itemsById = ds_map_create();

enum ITEM_TYPE {
	GENERIC,
	EAT,
	DRINK,
	EAT_ADD_INV,
	DRINK_ADD_INV
}

function setItemProp(item, prop, index) {
	item.itemProperties[index] = prop;
}	

function createNewItem(
	_name, spr, _hp, _info, fullHpTxt, outPutMsg,
	prop1 = {}, prop2 = itemNooneProp(), prop3 = itemNooneProp()) {
		
	var item = {
		name: _name,
		sprite: spr,
		hp: _hp,
		info: _info,
		fullHPText: fullHpTxt,
		outPutMessage: outPutMsg,
		itemProperties: [
			prop1,
			prop2,
			prop3
		],
		enchants: [],
		enchanted: false,
		id_item: _name
	}

	ds_map_add(global.itemsById, item.id_item, item);
	array_push(global.itemsInGame, item);
	return item;
}

function itemSetOutSound(_item) {
	switch (_item._type) {
		case ITEM_TYPE.GENERIC: return sndPlayerBasicHeal;
		case ITEM_TYPE.EAT: return sndPlayerEatingHeal;	
		case ITEM_TYPE.DRINK: return sndPlayerDrinkingHeal;	
	}
}

function createItemEat(_name, _spr, _hp, _info, _fullHpTxt, _outPutMsg, prop1 = itemNooneProp(), prop2 = itemNooneProp(), prop3 = itemNooneProp()) {
	var _item = createNewItem(_name, _spr, _hp, _info, _fullHpTxt, _outPutMsg, prop1, prop2, prop3);
	_item._type = ITEM_TYPE.EAT;
	_item.outSound = itemSetOutSound(_item);
	
	return _item;
}
function createItemDrink(_name, _spr, _hp, _info, _fullHpTxt, _outPutMsg, prop1 = itemNooneProp(), prop2 = itemNooneProp(), prop3 = itemNooneProp()) {
	var _item = createNewItem(_name, _spr, _hp, _info, _fullHpTxt, _outPutMsg, prop1, prop2, prop3);
	_item._type = ITEM_TYPE.DRINK;
	_item.outSound = itemSetOutSound(_item);
	return _item;
}

function createItemAddToInv(_itemType, _itemToAdd,  _name, _spr, _hp, _info, _fullHpTxt, _outPutMsg, prop1 = itemNooneProp(), prop2 = itemNooneProp(), prop3 = itemNooneProp()) {
	var _item = createNewItem(_name, _spr, _hp, _info, _fullHpTxt, _outPutMsg, prop1, prop2, prop3);
	_item._type = _itemType;
	_item.outSound = itemSetOutSound(_item);
	_item.toAddItem = _itemToAdd;
	return _item;
}