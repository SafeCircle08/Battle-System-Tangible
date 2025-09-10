function resetBattlePlayerVars(){
	with (oBattleManager) {
		global.playerShield = global.playerMaxShield;
		defended = 0;
		oSoul.damageTaken = 0;
	}
}