function propertyesOfHeals() {
	global.propertyHeal = setUpPropertyInfos(ITEM_PROPERTY_HEAL, "Simply recovers HPs", sHealPropertyDetailed);
	global.propertyDoubleHP = setUpPropertyInfos(ITEM_PROPERTY_DOUBLE_HEAL, "Doubles the HPs recovered from Items", sDoubleHealPropertyDetailed);
	global.propertyHealOverTime = setUpPropertyInfos(ITEM_PROPERTY_OVER_TIME_HEAL, "Recovers HPs Over Time", sOverTimeHealDetailed);
}