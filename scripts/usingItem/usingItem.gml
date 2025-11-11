function callItemFunctions(_itemFuncList) {
	for (var i = 0; i < MAX_PROPERTIES_NUMBER; i++) { 
		_itemFuncList[i](); 
	}	
}

function callItemEnchantments(_itemEnchList) {
	var _enchantsN = array_length(_itemEnchList);
	for (var i = 0; i < _enchantsN; i++) {
		_itemEnchList[i][ENCHANT_FUNCTION]();
		var _enchFx = instance_create_layer(mouse_x + 7 * i, mouse_y - 8 * i, LAYER_EFFECT_TOP_3, oEnchFxTest);
		_enchFx.frame = irandom_range(10, 90);
		_enchFx.spriteRef = _itemEnchList[i][ENCHANT_SPRITE];
		_enchFx.setNewSprite();
	}
}

function removeItemFromInventory(_itemList, _index, _number = 1) {
	array_delete(_itemList, _index, _number);	
}

function playerFullHP(_addedHps) {
	return 	(global.playerHP + _addedHps >= global.playerMAX_HP) 
}

function usingItem(_index)
{
	var _actualItem = global.equippedItems[_index];
	var _itemFunctions = _actualItem._itemFuncs;
	var _itemEnchants = _actualItem.enchants;
	var _gainedHps = _actualItem.hp;
	var _message;
	removeItemFromInventory(global.equippedItems, _index);

	_message = _actualItem.outPutMessage;
	if (playerFullHP(_gainedHps)) { _message = _actualItem.fullHPText; }
	callItemFunctions(_itemFunctions);
	callItemEnchantments(_itemEnchants);
	return _message;
}

function itemInfo(_index)
{
	if (_index >= array_length(global.equippedItems)) { return "There is nothing to show here.\nHave a good day!"; }
	var _actualItem = global.equippedItems[_index];
	var _itemInfo = _actualItem.info;
	return _itemInfo;
}