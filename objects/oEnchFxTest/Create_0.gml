frame = 0;
spriteRef = 0;
image_xscale = 0;
image_yscale = 1;

setNewSprite = function() {
	sprite_index = sprite_duplicate(spriteRef);
	sprite_set_offset(sprite_index, 5, 5);
}