takenDir = false;
dir = undefined;

enum HIT_TYPE {
	METAL,
	WOOD,
	PLASTIC,
	JELLY
}

playHitSound = function(_sounds) {
	var _index = arrayGetValidIndex(_sounds);
	var _snd = _sounds[_index];
	playSound(_snd, SOUND_CHANNEL_1);	
}

hit = function(_hitType, _min = 1, _max = 3) {
	oCamera.shake(irandom_range(_min, _max));
	instance_destroy(self);
	createGravityParticles(sUmbrellaShotGunBullet, LAYER_EFFECT_TOP_2, 1, x, y, 1.0);
	playHitSound(HIT_SOUNDS[_hitType]);
}