function healPlayer(_amount, _sound, _channel = SOUND_CHANNEL_1) {
	global.playerHP += _amount;
	var soundGain = 2;
	playSound(_sound, _channel, false, soundGain);
	if (oBattleManager.isInBulletHellSection()) {
		createFloatingText(oSoul.x, oSoul.y, _amount, FLOATING_TEXT_TYPES.HEALTH);
	} else {
		createFloatingText(mouse_x, mouse_y, _amount, FLOATING_TEXT_TYPES.HEALTH);
	}
}