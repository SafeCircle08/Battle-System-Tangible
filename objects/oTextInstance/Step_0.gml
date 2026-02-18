existanceTextTime++;

if (inBattle) {
	if (oBattleManager.isInBulletHellSection()) { 
		exit;
	}
}
manageTextInputs(text, inBattle, isActionsFlavourText, enemyAfterTurnText);