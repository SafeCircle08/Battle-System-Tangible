if (!isHandlingText()) exit;

draw_self();

if (specialDelay > 0) {
	specialDelay -= 1;
	exit;
}

if (inBattle) {
	if (oBattleManager.isInBulletHellSection()) exit; 
	else drawBattleBox();
}

drawTextBoxText();