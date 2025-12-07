function healPlayer(_amount, _sound, _channel = SOUND_CHANNEL_1) {
	global.playerHP += _amount;
	var soundGain = 2;
	playSound(_sound, _channel, false, soundGain);
	if (oBattleManager.isInBulletHellSection()) {
		createFloatingText(oSoul.x, oSoul.y, _amount, FLOATING_TEXT_TYPES.HEALTH);
	} else {
		var _x = mouse_x;
		var _y = mouse_y;
		createFloatingText(_x, _y, _amount, FLOATING_TEXT_TYPES.HEALTH);
	}
}