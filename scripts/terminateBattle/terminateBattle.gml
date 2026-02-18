function terminateBattle(_room) {
	room_goto(_room);
	instance_destroy(oBattleManager);
	
	oPlayerOW.applyBattleStartInfos();
	show_debug_message("Battle Terminated.");
}