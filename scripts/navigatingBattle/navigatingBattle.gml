function navigatingBattle(_minClam, _maxClamp) {
	if (!gettingGameInputs()) return;
	with (oBattleManager) {
		var _firstValue = selected_option;
		if keyboard_check_pressed(ord(global.keyBinds.down)) { selected_option++; }
		if keyboard_check_pressed(ord(global.keyBinds.up)) { selected_option--; }
		
		selected_option = clamp(selected_option, _minClam, _maxClamp);
	
		var soundGain = 0.6;
		if (selected_option != _firstValue) { playSound(sndNavigating_2, SOUND_CHANNEL_2, false, soundGain); }	
	}
}