disableGameInputs();
input_text = "";
keyboard_string = "";
commands = ["Spawn_Health"];

activeCMD = false;

finishedCommand = function() {
	enableGameInputs();
	global.lastCommand = input_text;
	input_text = "";
	keyboard_string = "";
	instance_deactivate_object(self);
}

healMeCommand = "heal_me";

executeHealCMD = function(_amount) {
	healPlayer(abs(_amount), sndPlayerBasicHeal);
	finishedCommand();
}

returnToLastExecutedCommand = function() {
		
}