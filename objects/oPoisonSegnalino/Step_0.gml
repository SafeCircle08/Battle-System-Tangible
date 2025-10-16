event_inherited();

if (timer > 0) {
	if (timer % poisonFreq == 0) {
		var _poisonDmg = irandom_range(minValue, maxValue);
		hitPlayer(_poisonDmg);	
	}
} else { destroySegnalino(); }