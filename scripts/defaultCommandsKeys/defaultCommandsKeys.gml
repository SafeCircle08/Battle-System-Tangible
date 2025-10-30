global.confirmKey = ord("E");
global.cancelKey = ord("Q");
global.confirmTextKey = vk_space;

function confirmPressed(_playSound = true, _key = global.confirmKey, _confirmSound = sndSelecting_2) {
	if (keyboard_check_pressed(_key) && gettingGameInputs()) {
		if (_playSound) {
			playSound(_confirmSound, SOUND_CHANNEL_1);
		}
		return true;
	}
	return false;
}

function cancelPressed(_key = global.cancelKey, _cancelSound = sndResetNavigation) {
	if (keyboard_check_pressed(_key) && gettingGameInputs()) {
		playSound(_cancelSound, SOUND_CHANNEL_1);
		return true;
	}	
	return false;
}

function confirmTextPressed(_key = global.confirmTextKey) {
	if (keyboard_check_pressed(_key) && gettingGameInputs()) {
		return true;
	}
	return false;
}