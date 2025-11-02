function playerGainShield(_shieldAmount = 50) {
	global.playerShield += _shieldAmount;
	global.playerShield = clamp(global.playerShield, 0, global.playerMaxShield);
	playSound(sndGainShield, SOUND_CHANNEL_1);
	createFloatingText(oSoul.x, oSoul.y, _shieldAmount, FLOATING_TEXT_TYPES.SHIELD);
}