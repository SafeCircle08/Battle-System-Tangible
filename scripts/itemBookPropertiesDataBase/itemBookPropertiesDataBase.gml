#macro PROPERTY_TEXT_SPRITE 0

itemPropertiesDeclaration();

function setUpPropertyInfos(property, propertyDesc, detSprite = sHealPropertyDetailed, _listToAdd = global.propertiesOfHealing, _enchanted = false) {
	var _newProp = {
		sprite: property,
		desc: propertyDesc,
		detailedSprite: detSprite,
		enchanted: _enchanted
	}
	array_push(_listToAdd, _newProp);
	if (!arrayContains(global.propertiesKind, _listToAdd)) { 
		array_push(global.propertiesKind, _listToAdd); 
	}
	return _newProp;
}

loadItemBookPropertiesKind();
loadInGameProperties();