#macro MAX_ENCHANTS_PER_ITEM_NUM 3

#region OTHER_FUNCTIONS

function addEnchant(_item, _specificEnch = undefined) {
	var _index = irandom_range(0, array_length(global.enchantsInGame) - 1);
	var _choosenEnchant = global.enchantsInGame[_index];
	array_push(_item.enchants,_choosenEnchant);	
	_item = setItemToEnchantedState(_item);
	return _item;
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

function enchantItem(_item, enchantsN = undefined, specificEnch = undefined) {
	var _changedItem = variable_clone(_item);
	if (canEnchant(_item)) {
		if (enchantsN == undefined) {
			_changedItem = addEnchant(_changedItem);
		} else {
			for (var i = array_length(_item.enchants); i < enchantsN; i++) {
				addEnchant(_item);
			}
		}
		changeToNewEnchants(_changedItem);
		playSound(sndEnchanting, SOUND_CHANNEL_1);
	}
	return _changedItem;
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