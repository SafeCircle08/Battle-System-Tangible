// Inherit the parent event
event_inherited();

slownessTimer = setTimer(slownessTimer);

if (slownessTimer > 0) {
	setPlayerSpd(slownedSpd);
} else {
	setPlayerSpd(DEFAULT_SOUL_SPD);
	destroySegnalino();
}