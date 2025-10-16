// Inherit the parent event
event_inherited();

if (timer > 0) {
	setPlayerSpd(minValue);
} else {
	setPlayerSpd(DEFAULT_SOUL_SPD);
	destroySegnalino();
}