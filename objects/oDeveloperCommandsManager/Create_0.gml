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
	show_debug_message("Command executed!");
}

healMeCommand = "heal_me";
chargeShieldCommand = "shield_me";
saveInvCommand = "inv_save";
loadInvCommand = "inv_load";
deleteInvSaveFile = "inv_savefdel";

executeHealCMD = function(_amount) {
	healPlayer(abs(_amount), sndPlayerBasicHeal);
	finishedCommand();
}

returnToLastExecutedCommand = function() {
	
}