event_inherited();

if (timer > 0) {
	createBubbleParticle(sPoisonBubble, oSoul.x, oSoul.y, LAYER_EFFECT_TOP_3, 20, 10, 3);
	if (timer % poisonFreq == 0) {
		var _poisonDmg = irandom_range(minValue, maxValue);
		hitPlayer(_poisonDmg);	
	}
} else { destroySegnalino(); }