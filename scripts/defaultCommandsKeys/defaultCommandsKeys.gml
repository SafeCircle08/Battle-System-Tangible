global.confirmKey = bindKey("E");
global.cancelKey = bindKey("Q");
global.confirmTextKey = bindKey(vk_space);

function confirmPressed(_playSound = true, _key = ord(global.keyBinds.confirm), _confirmSound = sndSelecting_2) {
	if (keyboard_check_pressed(_key) && gettingGameInputs()) {
		if (_playSound) {
			playSound(_confirmSound, SOUND_CHANNEL_1);
		}
		return true;
	}
	return false;
}

function cancelPressed(_key = ord(global.keyBinds.cancel), _cancelSound = sndResetNavigation) {
	if (keyboard_check_pressed(_key) && gettingGameInputs()) {
		playSound(_cancelSound, SOUND_CHANNEL_1);
		return true;
	}	
	return false;
}

function confirmTextPressed(_key = global.keyBinds.confirmText) {
	if (keyboard_check_pressed(_key) && gettingGameInputs()) {
		return true;
	}
	return false;
}