if (!isHandlingText()) exit;

updateCoords();
existanceTextTime++;

if (specialDelay > 0) {
	specialDelay -= 1;
	exit;
}

if (inBattle && (oBattleManager.isInBulletHellSection())) exit;

manageTextInputs();