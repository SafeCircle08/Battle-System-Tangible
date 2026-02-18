existanceTextTime++;

if (specialDelay > 0) {
	specialDelay -= 1;
	exit;
}

if (inBattle) {
	if (oBattleManager.isInBulletHellSection()) { 
		exit;
	}
}

manageTextInputs(text, inBattle, isActionsFlavourText, enemyAfterTurnText);