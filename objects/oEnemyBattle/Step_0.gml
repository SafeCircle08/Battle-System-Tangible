if (oBattleManager.isEnemySpeaking() == false) {
	if (instance_exists(myTextInstance)) { instance_destroy(myTextInstance); }
	myTextInstance = undefined;
}

if (enemyWillNotTalkAfterTurn()) createEnemyTextAfterPlayerAction();
if (enemyWillTalkAfterTurn()) createEnemyTextAfterBulletHellSection();