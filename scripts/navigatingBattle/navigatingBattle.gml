function navigatingBattle(_minClamp, _maxClamp) {
	if (!gettingGameInputs()) return;
	
	with (oBattleManager) {
		selected_option = navigate(selected_option, sndNavigating_2, _minClamp, _maxClamp);
	}
}

function navigate(_value, _snd = sndNavigating_2, _minClamp, _maxClamp) {
	if (!gettingGameInputs()) return;
	
	var _firstValue = _value;
	if keyboard_check_pressed(ord(global.keyBinds.down)) { _value++; }
	if keyboard_check_pressed(ord(global.keyBinds.up)) { _value--; }
		
	_value = clamp(_value, _minClamp, _maxClamp);
	
	var soundGain = 0.6;
	if (_value != _firstValue) { playSound(_snd, SOUND_CHANNEL_2, false, soundGain); }
	return _value;
}