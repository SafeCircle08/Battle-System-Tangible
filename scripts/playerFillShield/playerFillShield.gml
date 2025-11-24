function playerFillShield(){
	if (!playerIsOnFullShield()) {
		playerGainShield(global.playerMaxShield);
	}
}