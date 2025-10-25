function propertiesOfSegnalini() {
	var _toAddList = global.propertyOfSegnalini;
	var segnalinoDarkVision = setUpPropertyInfos(sDarkVisionProperty, "Makes you unable to See...", sDarkVisionPropertyDet, _toAddList);
	var segnalinoPoison = setUpPropertyInfos(ITEM_PROPERTY_POISON, "Deals Damage for a short duration", sPoisoningPropertyDet, _toAddList);
	var segnalinoSlowness = setUpPropertyInfos(sSlownessProperty, "Makes you go Slower than normal-", sSlownessPropertyDet, _toAddList);
	var segnalinoBrokenBones = setUpPropertyInfos(sBrokenBonesProperty, "Makes walking very painful.", sBrokenBonesPropertyDet, _toAddList);
	var segnalinoFrozen = setUpPropertyInfos(sFrozenProperty, "Might freeze you. The floor is icy.", sFrozenPropertyDet, _toAddList);
}