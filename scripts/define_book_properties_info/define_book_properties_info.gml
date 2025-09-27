#macro PROPERTY_INFO_SPRITE 0
#macro PROPERTY_INFO_DESC 1
#macro PROPERTY_TEXT_SPRITE 0

itemPropertiesDeclaration();

function setUpPropertyInfos(property, propertyDesc, detSprite = sHealPropertyDetailed, _enchanted = false) {
	return {
		sprite: property,
		desc: propertyDesc,
		detailedSprite: detSprite,
		enchanted: _enchanted
	}
}


global.propertiesOfHealing = [
	sHealingPropertyText,
	setUpPropertyInfos(ITEM_PROPERTY_HEAL, "Simply recovers HPs", sHealPropertyDetailed),
	setUpPropertyInfos(ITEM_PROPERTY_DOUBLE_HEAL, "Doubles the HPs recovered from Items", sDoubleHealPropertyDetailed),
	setUpPropertyInfos(ITEM_PROPERTY_OVER_TIME_HEAL, "Recovers HPs Over Time", sOverTimeHealDetailed),
];

global.propertiesOfBoosts = [
	sBoostsPropertyText,
	setUpPropertyInfos(ITEM_PROPERTY_DEF, "Increases the Defence value"),
	setUpPropertyInfos(ITEM_PROPERTY_ADD_TO_INV, "Adds a random Item to your Inventory"),
	setUpPropertyInfos(ITEM_PROPERTY_JUMP_BOOST, "Increases Jump Strength"),
	setUpPropertyInfos(ITEM_PROPERTY_STRENGTH, "Increases Strength Level", sStrengthPropertyDetailed),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "Increases the Water o' Meter's level"),
	setUpPropertyInfos(ITEM_PROPERTY_HACKER, "Converts Damage to 0, 1, 10 or 100", sHackerPropertyDetailed),
];

global.propertyOfPains = [
	sPainsPropertyText,
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "Consuming will cause endless pain", sBioHaazardPropertyDetailed),
	setUpPropertyInfos(ITEM_PROPERTY_MIGHT_HURT, "Cosuming MIGHT cause some pain...", sBioHaazardPropertyDetailed)
];

global.propertyOfEnchantments = [
	sMagickPropertyText,
	setUpPropertyInfos(ENCHANT_GOLDY[ENCHANT_SPRITE], "Returns [GOLD] after consuming", sGoldyEnchDetailed, true),
	setUpPropertyInfos(ENCHANT_OVER_TIME_HEAL[ENCHANT_SPRITE], "Will recover additional HPs over time", sOverTimeHealEnchDet, true),
	setUpPropertyInfos(ENCHANT_NIGHT_VISION[ENCHANT_SPRITE], "Makes You able to see in the Dark.", sNightVisionEnchPropertyDetailed, true)
];

global.propertyOfSegnalini = [
	sTagsPropertyText,
	setUpPropertyInfos(sDarkVisionProperty, "Makes you unable to See..."),
	setUpPropertyInfos(ITEM_PROPERTY_POISON, "Deals Damage for a short duration", sBioHaazardPropertyDetailed),
	setUpPropertyInfos(sSlownessProperty, "Makes you go Slower than normal-", sBioHaazardPropertyDetailed),
];

global.propertiesKind = [
	global.propertiesOfHealing,
	global.propertiesOfBoosts,
	global.propertyOfPains,
	global.propertyOfEnchantments,
	global.propertyOfSegnalini
];