event_inherited();

poisonTimer = setTimer(poisonTimer);

if (poisonTimer > 0) {
	if (poisonTimer % poisonFreq == 0) {
		var _poisonDmg = irandom_range(minPoisonDmg, maxPoisonDmg);
		hitPlayer(_poisonDmg);	
	}
} else {
	//Poison segnalino over
	destroySegnalino();
}