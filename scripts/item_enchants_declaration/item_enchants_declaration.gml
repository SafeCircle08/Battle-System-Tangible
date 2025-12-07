#macro ENCHANT_SPRITE 0
#macro ENCHANT_FUNCTION 1

function goldifier(){
	var _goldAmount = irandom_range(52, 204);
	global.playerGold += _goldAmount;
	
	createFloatingText(mouse_x + irandom_range(-20, 20), mouse_y, _goldAmount, FLOATING_TEXT_TYPES.GOLD);	

	if (!audio_is_playing(sndGettingGold)) {
		var _soundGain = 0.6;
		playSound(sndGettingGold, SOUND_CHANNEL_1, false, _soundGain);
	}
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

removeSegnalini()

function itemEnchantsDeclaration() {
	#macro ENCHANT_GOLDY [sGoldyEnchProperty, goldifier]
	#macro ENCHANT_POISON_FREE [sPoisonFreeEnchProperty, removePoisonTag]
	#macro ENCHANT_SLOWNESS_FREE [sRemoveSlownessEnchProperty, removeSlownessTag]
	#macro ENCHANT_REMOVE_SEGNALINI [sRemoveSegEnchProperty, removeSegnalini]
}

global.enchantsInGame = [
	ENCHANT_GOLDY,
	ENCHANT_POISON_FREE,
	ENCHANT_SLOWNESS_FREE,
	ENCHANT_REMOVE_SEGNALINI
];
