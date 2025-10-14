if (finishedEnchanting == false)
{
	if (confirmPressed()) && (placedItem != undefined) { confirmEnchant(); }
	if (mouse_check_button_pressed(mb_right)) { 
		if (mouseCursorIsOn(
			itemSpriteX + xAdder, 
			itemSpriteY, 
			itemSpriteX + 32 + xAdder, 
			itemSpriteY + 32)
		) { removeItem(); }
	}
}

if (showingInv) {
	with (oBattleManager) {
		if (other.canFadeInv) { inventoryFadeIn(); }
		else { inventoryFadeOut(); } 
		navigatingInventoryFunction(DONT_GET_INPUTS, CAN_NAVIGATE);
	}
	if (confirmPressed(false)) { placeItem(); }
} else { with (oBattleManager) { inventoryFadeOut(); } }

//Animationd
if (fadingIn == true) && (fadedIn == false) { fadeIn(); }
if (fadingOut == true) { fadeOut(); }