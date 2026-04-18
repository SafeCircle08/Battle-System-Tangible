function loadEnchantments() {
	global.enchGoldy = createEnchant("Goldifier", sGoldyEnchProperty, goldifier, false);
	global.enchPoisonFree = createEnchant("Poison Free", sPoisonFreeEnchProperty, removePoisonTag, false);
	global.enchSlownessFree = createEnchant("Slowness Free", sRemoveSlownessEnchProperty, removeSlownessTag, false);
	//global.enchRemoveSegnalini = createEnchant("Remove Segnalini", sRemoveSegEnchProperty, removeSegnalini, false);
	//global.doubleusageEnch = createEnchant("Double Usage", sDoubleUsageEnchProp, function(item, _enchIndex) { doubleUsage(item, _enchIndex); }, false);
}