#macro ENCHANT_SPRITE 0
#macro ENCHANT_FUNCTION 1


function itemEnchantsDeclaration() {
	#macro ENCHANT_GOLDY [sGoldyEnchProperty, goldifier]
	#macro ENCHANT_OVER_TIME_HEAL [sOverTimehealEnchProperty, overTimeHeal]
	#macro ENCHANT_NIGHT_VISION [sNightVisionEnchProperty, setToNightVision]
	#macro ENCHANT_POISON_FREE [sPoisonFreeEnchProperty, removePoisonTag]
	#macro ENCHANT_SLOWNESS_FREE [sRemoveSlownessEnchProperty, function() { removeSegnalino(oSlownessSegnalino); }]
	#macro ENCHANT_REMOVE_SEGNALINI [sRemoveSegEnchProperty, function() { removeSegnalini(true); }]
}

global.enchantsInGame = [
	ENCHANT_GOLDY,
	ENCHANT_OVER_TIME_HEAL,
	ENCHANT_NIGHT_VISION,
	ENCHANT_POISON_FREE,
	ENCHANT_SLOWNESS_FREE,
	ENCHANT_REMOVE_SEGNALINI
];