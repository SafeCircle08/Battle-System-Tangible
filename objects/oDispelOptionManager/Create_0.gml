event_inherited();

openSpecialInventory();
oBattleManager.selected_option = 0;

selected = false;
itemSelected = global.equippedItems[0];

subIndex = 0;

canNavigateInv = true;
dispelling = false;

dispelDelay = 3;
dispelsLeft = 3;

finished = false;

selecteItem = function() {
	selected = true;	
	dispelling = true;
	canNavigateInv = false;
	itemSelected = global.equippedItems[oBattleManager.selected_option];
	
	var _dpX = getItemInvSprX() + sprite_get_width(sBandagesItem) + INVENTORY_MAX_X_ADDER;
	var _dpY = getItemInvSprY();
	
	instance_create_layer(_dpX + 6, _dpY + 5, LAYER_EFFECT_TOP_4, oDispelIndicator);
}

unselectItem = function() {
	selected = false;
	dispelling = false;
	canNavigateInv = true;
	subIndex = 0;
	dispelDelay = 3;
	itemSelected = global.equippedItems[0];	
	instance_destroy(oDispelIndicator);
}

canDispel = function(i) {
	var sel = oBattleManager.selected_option;
	var l = array_length(global.equippedItems[sel].enchants);
	if (l <= 0 || i >= l) return;
	return global.equippedItems[sel].enchants[i].cursed;
}

finish = function() {
	instance_destroy(oDispelIndicator);
	instance_destroy(self);
}

dispelItem = function() {
	var _i = oBattleManager.selected_option;
	global.equippedItems[_i] = removeEnchant(global.equippedItems[_i], subIndex);
	dispelsLeft -= 1;
	
	if (dispelsLeft == 0) {
		terminateAction(["*Maximum dispels per turn\n reached.", "*The Battle\n Continues."]);
		closeSpecialInventory();
		instance_destroy(oDispelIndicator);
		finished = true;
	}
}