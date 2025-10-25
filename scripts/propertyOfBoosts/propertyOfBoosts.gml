function propertyesOfBoosts() {
	var _toAddList = global.propertiesOfBoosts;
	var propertyDef = setUpPropertyInfos(ITEM_PROPERTY_DEF, "Increases the Defence value", sDefencePropertyDetailed, _toAddList);
	var propertyAddToInv = setUpPropertyInfos(ITEM_PROPERTY_ADD_TO_INV, "Adds a random Item to your Inventory", sAddToInvPropertyDetailed, _toAddList);
	var propertyIncrJump = setUpPropertyInfos(ITEM_PROPERTY_JUMP_BOOST, "Increases Jump Strength", sJumpBoostPropertyDetailed, _toAddList);
	var propertyIncrStrength = setUpPropertyInfos(ITEM_PROPERTY_STRENGTH, "Increases Strength Level", sStrengthPropertyDetailed, _toAddList);
	var propertyIncrWaterMeter = setUpPropertyInfos(ITEM_PROPERTY_WATER, "Increases the Water o' Meter's level", sHealPropertyDetailed, _toAddList);
	var propertyHacker = setUpPropertyInfos(ITEM_PROPERTY_HACKER, "Converts Damage to 0, 1, 10 or 100", sHackerPropertyDetailed, _toAddList);
	var propertyIncrSpeed = setUpPropertyInfos(ITEM_PROPERTY_SPD, "Increases you Speed", sSpeedPropertyDetailed, _toAddList);
}