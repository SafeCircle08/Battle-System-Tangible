#macro MAX_ENCHANTS_PER_ITEM_NUM 3

#region OTHER_FUNCTIONS

function applyCurseStatsToItem(_item, _choosenEnchant) { _choosenEnchant.curseInstantFunc(_item); }

function addEnchant(_item, _curse = false, _specificEnch = undefined) {
	var _list = global.enchantsInGame;
	if (_curse) { 
		_list = global.cursesInGame;
		_item.cursed = true;
	}
	var _index = irandom_range(0, array_length(_list) - 1);
	var _choosenEnchant = _list[_index];
	
	if (_curse) { applyCurseStatsToItem(_item, _choosenEnchant); }
	
	array_push(_item.enchants,_choosenEnchant);	
	_item = setItemToEnchantedState(_item);
	return _item;
}

function addCurse(_item, _specificCurse = undefined) { 
	addEnchant(_item, true, _specificCurse); 
}

function canEnchant(_item) {
	if (array_length(_item.enchants) < MAX_ENCHANTS_PER_ITEM_NUM) {
		return true;
	}
	return false;
}

function changeToNewEnchants(_changedItem) {
	with (oBattleManager) {
		global.equippedItems[selected_option] = _changedItem;
	}
}

function isEnchanted(_item) {
	return _item.enchanted;	
}

#endregion

function enchantItem(_item, _curse = false, enchantsN = undefined, specificEnch = undefined) {
	var _changedItem = variable_clone(_item);
	if (canEnchant(_item)) {
		if (enchantsN == undefined) {
			_changedItem = addEnchant(_changedItem, _curse, specificEnch);
		} else {
			for (var i = array_length(_changedItem.enchants); i < enchantsN; i++) {
				_changedItem = addEnchant(_changedItem, _curse, specificEnch);
			}
		}
		changeToNewEnchants(_changedItem);
		playSound(sndEnchanting, SOUND_CHANNEL_1);
	}
	return _changedItem;
}

function curseItem(_item, cursesN = undefined, specificCurse = undefined) {
	
}

function disenchantItem(_item) {
	if (isEnchanted(_item)) {
		var _disenchantedItem = variable_clone(_item);
		_disenchantedItem.enchanted = false;
		_disenchantedItem.enchants = [];
		playSound(sndDisenchanting, SOUND_CHANNEL_1);
		changeToNewEnchants(_disenchantedItem);
	}
}