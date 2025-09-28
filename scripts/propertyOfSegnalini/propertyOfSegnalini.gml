function propertiesOfSegnalini() {
	var _toAddList = global.propertyOfSegnalini;
	global.segnalinoDarkVision = setUpPropertyInfos(sDarkVisionProperty, "Makes you unable to See...", sHealPropertyDetailed, _toAddList);
	global.segnalinoPoison = setUpPropertyInfos(ITEM_PROPERTY_POISON, "Deals Damage for a short duration", sBioHaazardPropertyDetailed, _toAddList);
	global.segnalinoSlowness = setUpPropertyInfos(sSlownessProperty, "Makes you go Slower than normal-", sBioHaazardPropertyDetailed, _toAddList);
}