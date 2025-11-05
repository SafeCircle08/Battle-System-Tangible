function goldifier(){
	var _goldAmount = irandom_range(52, 204);
	global.playerGold += _goldAmount;
	
	createFloatingText(mouse_x + irandom_range(-20, 20), mouse_y + irandom_range(-20, 20), _goldAmount, FLOATING_TEXT_TYPES.GOLD, true);	

	if (!audio_is_playing(sndGettingGold)) {
		var _soundGain = 0.6;
		playSound(sndGettingGold, SOUND_CHANNEL_1, false, _soundGain);
	}
}