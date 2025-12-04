function propertyesOfEnchantments() {
	var _toAddList = global.propertyOfEnchantments;
	var enchantGold = setUpPropertyInfos(ENCHANT_GOLDY[ENCHANT_SPRITE], "Returns [GOLD] after consuming", sGoldyEnchDetailed, _toAddList, true);
	var enchantPoisonFree = setUpPropertyInfos(ENCHANT_POISON_FREE[ENCHANT_SPRITE], "Removes Poison Tag", sPoisonFreeEnchDet, _toAddList, true);
	var enchantSlownessFree = setUpPropertyInfos(ENCHANT_SLOWNESS_FREE[ENCHANT_SPRITE], "Returns to ogirinal Speed", sRemoveSlownessEnchDet, _toAddList, true);
	var enchantRemoveSegnalini = setUpPropertyInfos(ENCHANT_REMOVE_SEGNALINI[ENCHANT_SPRITE], "Removes all segnalini effects.", sRemoveSegEnchPropertyDet, _toAddList, true);
}