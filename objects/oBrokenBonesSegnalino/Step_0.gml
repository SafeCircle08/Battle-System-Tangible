// Inherit the parent event
event_inherited();

if (timer > 0) {
	if (playerIsMoving() && (timer % bonesFrequency == 0)) {
		var _brokenBonesDmg = irandom_range(minValue, maxValue);
		hitPlayer(_brokenBonesDmg);	
	}
} else { destroySegnalino(); }