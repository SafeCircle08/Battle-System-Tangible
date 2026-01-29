function skipTurn() {
	if (oBattleManager.isInBulletHellSection()) {
		finishTurn();
		oSoul.setToDefaultPos();
	}
}