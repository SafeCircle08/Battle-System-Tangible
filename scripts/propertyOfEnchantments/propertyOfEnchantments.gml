function propertyesOfEnchantments() {
	var _toAddList = global.propertyOfEnchantments;
	global.enchantGold = setUpPropertyInfos(ENCHANT_GOLDY[ENCHANT_SPRITE], "Returns [GOLD] after consuming", sGoldyEnchDetailed, _toAddList, true);
	global.enchantHealOverTime = setUpPropertyInfos(ENCHANT_OVER_TIME_HEAL[ENCHANT_SPRITE], "Will recover additional HPs over time", sOverTimeHealEnchDet, _toAddList, true);
	global.enchantNightVision = setUpPropertyInfos(ENCHANT_NIGHT_VISION[ENCHANT_SPRITE], "Makes You able to see in the Dark", sNightVisionEnchPropertyDetailed, _toAddList, true);
	global.enchantPoisonFree = setUpPropertyInfos(ENCHANT_POISON_FREE[ENCHANT_SPRITE], "Removes Poison Tag", sGoldyEnchDetailed, _toAddList, true);
	global.enchantSlownessFree = setUpPropertyInfos(ENCHANT_SLOWNESS_FREE[ENCHANT_SPRITE], "Returns to ogirinal Speed", sGoldyEnchDetailed, _toAddList, true);
}