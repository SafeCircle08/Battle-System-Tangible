function propertiesOfPains() {
	var _toAddList = global.propertyOfPains;
	global.propertyBioHaazard = setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "Consuming will cause endless pain", sBioHaazardPropertyDetailed, _toAddList);
	global.propertyMightHurt = setUpPropertyInfos(ITEM_PROPERTY_MIGHT_HURT, "Cosuming MIGHT cause some pain...", sBioHaazardPropertyDetailed, _toAddList);
}