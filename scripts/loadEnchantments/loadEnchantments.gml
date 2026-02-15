function loadEnchantments() {
	global.enchGoldy = createEnchant("Goldifier", sGoldyEnchProperty, goldifier);
	global.enchPoisonFree = createEnchant("Poison Free", sPoisonFreeEnchProperty, removePoisonTag);
	global.enchSlownessFree = createEnchant("Slowness Free", sRemoveSlownessEnchProperty, removeSlownessTag);
	global.enchRemoveSegnalini = createEnchant("Remove Segnalini", sRemoveSegEnchProperty, removeSegnalini);
	global.doubleusageEnch = createEnchant("Double Usage", sDoubleUsageEnchProp, function(item, _enchIndex) { doubleUsage(item, _enchIndex); })
}