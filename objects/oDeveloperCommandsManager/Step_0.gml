if (keyboard_check_pressed(vk_alt)) {
	enableGameInputs();
	instance_destroy(self);
}

var key = keyboard_lastchar;
if (keyboard_string != "") {
    input_text = keyboard_string;
}

if (keyboard_check_pressed(vk_backspace)) {
    input_text = string_delete(input_text, string_length(input_text), 1);
}

if (keyboard_check_pressed(vk_up)) {
	input_text = global.lastCommand;
}

if (keyboard_check_pressed(vk_enter)) {
	
	if (input_text == healMeCommand) { executeHealCMD(100); exit; }
	if (input_text == chargeShieldCommand) { playerGainShield(); finishedCommand(); exit; }
	
	if (string_starts_with(input_text, saveInvCommand)) { saveItems(); finishedCommand(); exit; }
	if (string_starts_with(input_text, loadInvCommand)) { loadItemsSimple(); finishedCommand(); exit; }
	
	if (string_starts_with(input_text, healMeCommand)) {
		var _hpAmount = 0;
		var _spacePos = string_pos(" ", input_text);
		
		if (_spacePos > 0) {
			var argument_1 = string_copy(input_text, _spacePos + 1, string_length(input_text));
			if (argument_1 == "max") {
				global.playerHP = global.playerMAX_HP;
				executeHealCMD(0);
				exit;
			} else if (charIsNumeric(string_char_at(argument_1, 1))) {
				_hpAmount = real(argument_1);
				executeHealCMD(_hpAmount);
				exit;					
			}
		} 
		else {
			input_text = "\ncould not find \nthe written\n command...";	
		}
	}
}