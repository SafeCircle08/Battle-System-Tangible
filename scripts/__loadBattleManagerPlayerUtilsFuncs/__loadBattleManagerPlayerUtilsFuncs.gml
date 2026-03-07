function __loadBattleManagerPlayerUtilsFuncs(){
	playerMainActionTurn = function() {
		return (playerTurn == true) &&
			   (showActionsFlavourText == false) && 
			   (decidingSubAction == false) && 
			   (!isEnemySpeaking())
	}
	isNotPlayerTurn = function(){
		return (playerTurn == false) &&
			   (showActionsFlavourText == false) &&
			   (isInBulletHellSection()) &&
			   (!isEnemySpeaking());
	}
	playerIsDefended = function() {
		return defended;	
	}
}