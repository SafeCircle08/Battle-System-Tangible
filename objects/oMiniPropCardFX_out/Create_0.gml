image_xscale = 2;
image_yscale = 2;

playSound(sndSwipe_2, SOUND_CHANNEL_1, false, 0.2);

deleteSprRef = function() {
	print("Spr eliminato: " + string(sprite_index))
	sprite_delete(sprite_index);	
}