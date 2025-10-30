function resetPlayerBattleVars(){
	
	global.playerShield = global.playerMaxShield;
	
	with (oSoul) {
		damageTaken = 0;
	}
	
	with (oBattleManager) {
		defended = 0;
	}
}