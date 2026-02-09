function propertyesOfEnchantments() {
	var _toAddList = global.propertyOfEnchantments;
	
	var enchantGold = setUpPropertyInfos(sGoldyEnchProperty, "Returns [GOLD] after consuming", sGoldyEnchDetailed, _toAddList, true);
	var enchantPoisonFree = setUpPropertyInfos(sPoisonFreeEnchProperty, "Removes Poison Tag", sPoisonFreeEnchDet, _toAddList, true);
	var enchantSlownessFree = setUpPropertyInfos(sRemoveSlownessEnchProperty, "Returns to ogirinal Speed", sRemoveSlownessEnchDet, _toAddList, true);
	var enchantRemoveSegnalini = setUpPropertyInfos(sRemoveSegEnchProperty, "Removes all segnalini effects.", sRemoveSegEnchPropertyDet, _toAddList, true);
	var enchantDoubleUse = setUpPropertyInfos(sDoubleUsageEnchProp, "The Item can be used twice.", sDoubleUsageEnchPropDet, _toAddList, true);
}