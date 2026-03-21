if (!isHandlingText()) return;

updateCoords();
existanceTextTime++;

if (specialDelay > 0) {
	specialDelay -= 1;
	exit;
}

if (inBattle) {
	if (oBattleManager.isInBulletHellSection()) exit;
}

manageTextInputs(inBattle, isActionsFlavourText, enemyAfterTurnText);