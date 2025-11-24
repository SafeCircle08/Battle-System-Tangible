function shield_shards() {
	instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oShieldDebris);
	audio_play_sound(sndShieldBroke, 50, false, global.soundGain);
	var _x = oSoul.x;
	var _y = oSoul.y;
	createGravityParticles(sShieldShard, LAYER_BULLETS, 5, _x, _y, 1);
}