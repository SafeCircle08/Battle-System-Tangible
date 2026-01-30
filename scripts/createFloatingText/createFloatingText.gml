function manageFlTextDir(_fTextN = instance_number(oFloatingText)) {
	var _dir = FLOATING_TEXT_DIR.RIGHT;
	if (_fTextN % 2 == 0) { _dir = FLOATING_TEXT_DIR.LEFT; }
	return _dir;
}

function flTextIsSpecial(_type) {
	return (
		(_type == FLOATING_TEXT_TYPES.HEALTH) || 
		(_type == FLOATING_TEXT_TYPES.SHIELD) ||
		(_type == FLOATING_TEXT_TYPES.DAMAGE)
	);	
}


function createFloatingText(_x, _y, _txtRef, _type) {
	var _randomX = 15;
	var _fTextN = instance_number(oFloatingText);
	_x = _x + irandom_range(-_randomX, _randomX);
	_y = _y + (15 * _fTextN);
	
	if (!audio_is_playing(sndPop) && (!flTextIsSpecial(_type))) {
		playSound(sndPop, SOUND_CHANNEL_3);	
	}
	
	if (mouseIsTooFarWindow()) {
		var _heightOffSet = 60;
		_x = room_width / 2 + irandom_range(-_randomX, _randomX);
		_y = (room_width / 2 - _heightOffSet) + (15 * _fTextN);	
	}
	
	var floatingText = instance_create_layer(_x, _y, LAYER_EFFECT_TOP_2, oFloatingText);
	floatingText.initVars(_txtRef, _type);
}