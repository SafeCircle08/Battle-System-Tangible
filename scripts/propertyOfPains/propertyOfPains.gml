function propertiesOfPains() {
	var _toAddList = global.propertyOfPains;
	var propertyBioHaazard = setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "Consuming will cause endless pain", sBioHaazardPropertyDetailed, _toAddList);
	var propertyMightHurt = setUpPropertyInfos(ITEM_PROPERTY_MIGHT_HURT, "Cosuming MIGHT cause some pain...", sMightHurtDetailed, _toAddList);
}