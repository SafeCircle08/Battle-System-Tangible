function resetPlayerBattleVars(){
	resetPlayerOffsets();
	
	with (oSoul) {
		damageTaken = 0;
		//speed = 0;
		//boost = 0;
		//...
	}
	
	with (oBattleManager) {
		defended = 0;
	}
}