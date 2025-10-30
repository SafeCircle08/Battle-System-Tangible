function hitPlayer(_dmg, _snd = sndHurt) {
	global.playerHP -= _dmg;
	playSound(_snd, SOUND_CHANNEL_1);
	createHitSlashes(2);
	createFloatingText(oSoul.x, oSoul.y, _dmg, FLOATING_TEXT_TYPES.DAMAGE);
	
	if (instance_exists(oSoul)) {
		oSoul.damageTaken += _dmg;
	}
	
	return;
}