// Inherit the parent event
event_inherited();

//@OVERRIDE SECTION ------------------------------
segnalinoSprite = sBrokenBonesProperty;
createSegnalino(segnalinoSprite);
bonesFrequency = 0;
printSegnalinoInfos();

bonesSprs = [sBrokenBone_1, sBrokenBone_2, sBrokenBone_3, sBrokenBone_4];


createBonesParticles = function() {
	var _boneN = irandom_range(2, 4) * level;
	var _x = oSoul.x;
	var _y = oSoul.y;
	var _rotSpd = irandom_range(4, 6);
	var _alphaValue = irandom_range(0.05, 0.2);
	
	createGravityParticles(
		bonesSprs, 
		LAYER_EFFECT_TOP_2, 
		_boneN, _x, _y, 
		3, -3, -1, -2, 0.07, 
		true, _rotSpd, 
		true, _alphaValue);		
}