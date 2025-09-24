// Inherit the parent event
event_inherited();

slownessTimer = setTimer(slownessTimer);

if (slownessTimer > 0) {
	setPlayerSpd(slownedSpd);
} else {
	setPlayerSpd(2);
	destroySegnalino();
}