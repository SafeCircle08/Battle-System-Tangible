function propertyesOfBoosts() {
	var _toAddList = global.propertiesOfBoosts;
	global.propertyDef = setUpPropertyInfos(ITEM_PROPERTY_DEF, "Increases the Defence value", sHealPropertyDetailed, _toAddList);
	global.propertyAddToInv = setUpPropertyInfos(ITEM_PROPERTY_ADD_TO_INV, "Adds a random Item to your Inventory", sHealPropertyDetailed, _toAddList);
	global.propertyIncrJump = setUpPropertyInfos(ITEM_PROPERTY_JUMP_BOOST, "Increases Jump Strength", sHealPropertyDetailed, _toAddList);
	global.propertyIncrStrength = setUpPropertyInfos(ITEM_PROPERTY_STRENGTH, "Increases Strength Level", sStrengthPropertyDetailed, _toAddList);
	global.propertyIncrWaterMeter = setUpPropertyInfos(ITEM_PROPERTY_WATER, "Increases the Water o' Meter's level", sHealPropertyDetailed, _toAddList);
	global.propertyHacker = setUpPropertyInfos(ITEM_PROPERTY_HACKER, "Converts Damage to 0, 1, 10 or 100", sHackerPropertyDetailed, _toAddList);
	global.propertyIncrSpeed = setUpPropertyInfos(ITEM_PROPERTY_SPD, "Increases you Speed", sHealPropertyDetailed, _toAddList);
}