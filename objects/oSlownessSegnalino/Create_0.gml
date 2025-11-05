// Inherit the parent event
event_inherited();

//@OVERRIDE SECTION ------------------------------
segnalinoSprite = sSlownessProperty;
createSegnalino(segnalinoSprite);

removeRealSegnalino = function() {
	destroySegnalino();
	setPlayerSpd(DEFAULT_SOUL_SPD);
}