function setToNightVision() {
	if (instance_exists(oDarkVision)) {
		instance_destroy(oDarkVision);	
	}
	oSoul.stopSegnalino(true, SEGNALINO_NIGHT_VISION);
}