// Inherit the parent event
event_inherited();

slownessLV = 0;
slownessAmount = 0.5;
slownessTimer = 400;
slownedSpd = DEFAULT_SOUL_SPD - slownessAmount;
createSegnalino(sSlownessProperty);

printInfo = function() {
	print("Slowness amount: " + string(slownessAmount));
	print("Slowness timer: " + string(slownessTimer));
	print("Slowed spd: " + string(slownedSpd));
	print("Slowness lv: " + string(slownessLV))
}