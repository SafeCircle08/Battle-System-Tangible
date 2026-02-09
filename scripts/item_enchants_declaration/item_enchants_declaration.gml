global.enchantsById = ds_map_create();
global.enchantsInGame = [];

function goldifier(){
	var _goldAmount = irandom_range(52, 204);
	global.playerGold += _goldAmount;
	
	createFloatingText(mouse_x + irandom_range(-20, 20), mouse_y, _goldAmount, FLOATING_TEXT_TYPES.GOLD);	

	if (!audio_is_playing(sndGettingGold)) {
		var _soundGain = 0.6;
		playSound(sndGettingGold, SOUND_CHANNEL_1, false, _soundGain);
	}
}

function doubleUsage(item, _enchIndex) {
	var _reusedItem = removeEnchant(item, _enchIndex);
	if (array_length(global.equippedItems) == 8) global.equippedItems[MAX_ITEMS_NUM - 1] = _reusedItem;
	else addItemToInventory(_reusedItem);
}

function removePoisonTag() {
	removeSegnalino(oPoisonSegnalino);
}

function removeSlownessTag() {
	removeSegnalino(oSlownessSegnalino);		
}

function removeSegnalini(_showRemovedSegNames = true) {
	for (var i = instance_number(oSegnalinoParent) - 1; i >= 0; i--) {
		var _actualSeg = instance_find(oSegnalinoParent, i);
		removeSegnalino(_actualSeg, _showRemovedSegNames);
	}
}

function createEnchant(_enchName, _spr, _func, _desc = "") {
	var _newEnch = {
		name: _enchName,
		sprite: _spr,
		func: _func,
		desc: _desc,
		ench_id: _enchName
	}
	ds_map_add(global.enchantsById, _newEnch.ench_id, _newEnch);
	array_push(global.enchantsInGame, _newEnch);
	return _newEnch;
}

global.enchGoldy = createEnchant("Goldifier", sGoldyEnchProperty, goldifier);
global.enchPoisonFree = createEnchant("Poison Free", sPoisonFreeEnchProperty, removePoisonTag);
global.enchSlownessFree = createEnchant("Slowness Free", sRemoveSlownessEnchProperty, removeSlownessTag);
global.enchRemoveSegnalini = createEnchant("Remove Segnalini", sRemoveSegEnchProperty, removeSegnalini);
global.doubleusageEnch = createEnchant("Double Usage", sDoubleUsageEnchProp, function(item, _enchIndex) { doubleUsage(item, _enchIndex); })