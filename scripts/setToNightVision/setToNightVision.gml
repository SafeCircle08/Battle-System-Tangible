function setToNightVision() {
	removeSegnalino(oDarkSegnalino);
	if (instance_exists(oDarkVision)) {
		instance_destroy(oDarkVision);
	}
}