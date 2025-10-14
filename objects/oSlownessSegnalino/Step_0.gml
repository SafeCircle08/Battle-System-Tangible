// Inherit the parent event
event_inherited();

timer = setTimer(timer);

if (timer > 0) {
	setPlayerSpd(minValue);
} else {
	setPlayerSpd(DEFAULT_SOUL_SPD);
	destroySegnalino();
}