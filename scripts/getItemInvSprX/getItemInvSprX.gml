function getItemInvSprX(){
	return INVENTORY_X + sprite_get_width(setToGuiBgSelectedTheme()) * 3 - sprite_get_width(sItemSprite) - 10 - 7;
}