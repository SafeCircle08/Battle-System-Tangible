newSpr = 0;

changeToFadeOut = function() {
	var _outFx = instance_create_layer(x, y, LAYER_EFFECT_TOP_2, oMiniPropCardFX_out);
	_outFx.sprite_index = newSpr;
	instance_destroy(self);
}

duplicateSprite = function() {
	newSpr = sprite_duplicate(sprite_index);
	sprite_index = newSpr;
}

setSpriteOffSet = function() {
	sprite_set_offset(newSpr, 5, 5);
}	

deleteSprRef = function() {
	sprite_delete(newSpr);	
}