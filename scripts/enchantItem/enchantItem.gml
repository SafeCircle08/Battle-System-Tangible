#macro MAX_ENCHANTS_PER_ITEM_NUM 3

#region OTHER_FUNCTIONS

/*
function printEnchList(_item) {
	var _n = [];
	for (var i = 0; i < array_length(_item.enchants); i++) {
		array_push(_n, _item.enchants[i].name);	
	}
	show_debug_message(_n);
	return _n;
}
*/

function applyCurseStatsToItem(_item, _curse) { _curse.curseInstantFunc(_item); }
function resetItemStatBeforeCurse(_item, _curse) { 
	_curse.removeCurseFunc(_item); 
}

function __getEnchantsContained(_item) {
	var _enchs = [];
	for (var i = 0; i < array_length(_item.enchants); i++) {
		var _e = _item.enchants[i];
		var _n = _e.name;
		if (!array_contains(_enchs, _n)) array_push(_enchs, _n);
	}
	return _enchs;
}

function generatevalidEnchList(_item, _list) {
	var _l = [];
	var _eContained = __getEnchantsContained(_item);
	
	for (var i = 0; i < array_length(_list); i++) {
		var _actualEnch = _list[i];
		var _n = _actualEnch.name;
		
		var _alreadyHas = array_contains(_eContained, _n);
		if (!_alreadyHas || _actualEnch.multiple == true) array_push(_l, _actualEnch);
	}
	return _l;
}

function addEnchant(_item, _curse = false, _specificEnch = undefined) {
	var _eContained = __getEnchantsContained(_item);
	
	var _list = generatevalidEnchList(_item, global.enchantsInGame);
	if (_curse) _list = generatevalidEnchList(_item, global.cursesInGame);
	
	var _index = irandom_range(0, array_length(_list) - 1);
	var _choosenEnchant = _list[_index];
	var _eName = _choosenEnchant.name;
	
	if (_choosenEnchant.multiple == false && array_contains(_eContained, _eName)) {
		return _item;
	}
	
	if (_curse) _item.cursed = true;
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
	enchantItem(_item, true, undefined, undefined);
}

function disenchantItem(_item, _onlyCurses = false) {
	if (isEnchanted(_item)) {
		var _disenchantedItem = variable_clone(_item);
		
		if (_onlyCurses == true) {
		for (var i = array_length(_item.enchants) - 1; i >= 0; i--) {
			var _actualCurse = _disenchantedItem.enchants[i];
				if (_actualCurse.cursed == true) {
					
					_disenchantedItem = removeEnchant(_disenchantedItem, i);
					resetItemStatBeforeCurse(_disenchantedItem, _actualCurse);
					
					continue;
				}
			}
		} else {
			_disenchantedItem.enchanted = false;
			_disenchantedItem.enchants = [];				
		}
		playSound(sndDisenchanting, SOUND_CHANNEL_1);
		changeToNewEnchants(_disenchantedItem);
	}
}


