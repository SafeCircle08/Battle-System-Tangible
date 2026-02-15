function setUpProperty(_sprite, _func) {
	return {
		sprite: _sprite,
		func: _func
	}
}

function loadItemPropertiesFuncs() {
	function itemHeal(_item) { healPlayer(_item.hp, _item.outSound); }
	function itemHit(_item) { hitPlayer(-_item.hp); }
	
	function propertyHit() { return setUpProperty(sBioHaazardProperty, function(item) { hitPlayer(-item.hp); }) }
	function propertyNoone() { return setUpProperty(sNooneProperty, function() {}); }
	function propertyHeal() { return setUpProperty(sHealProperty, function(item) { itemHeal(item); }) }
	function propertyDoubleHeal() { return setUpProperty(sDoubleHealProperty, function(item) { itemHeal(item); itemHeal(item); }) }
	function propertyDefence() { return setUpProperty(sDefenceProperty, function() {}); }
	function propertyAddToInv() { return setUpProperty(sAddToInvProp, function(item) { addItemToInventory(item.toAddItem, true); }) }
	function propertyWarmUp() { return setUpProperty(sWarmProperty, function() { warmUpPlayer(); }); }	
}