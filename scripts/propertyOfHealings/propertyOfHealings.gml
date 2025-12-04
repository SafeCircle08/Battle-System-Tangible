function propertyesOfHeals() {
	var propertyHeal = setUpPropertyInfos(ITEM_PROPERTY_HEAL, "Simply recovers HPs", sHealPropertyDetailed);
	var propertyDoubleHP = setUpPropertyInfos(ITEM_PROPERTY_DOUBLE_HEAL, "Doubles the HPs recovered from Items", sDoubleHealPropertyDetailed);
	var propertyHealOverTime = setUpPropertyInfos(ITEM_PROPERTY_OVER_TIME_HEAL, "Recovers HPs Over Time", sOverTimeHealDetailed);
	var propertyWarmHeal = setUpPropertyInfos(ITEM_PROPERTY_WARM_HEAL, "Warms you and returns some HPs.", sWarmPropertyDetailed);
}