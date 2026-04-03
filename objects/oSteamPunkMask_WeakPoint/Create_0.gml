enum SPM_WEAK_POINT_STATES {
	COVERED,
	EXPOSED
}

state = SPM_WEAK_POINT_STATES.COVERED;

hits = 20;
hits_hit = 0;
image_speed = 0;

attachSteamPunkMaskValues = function() {
	x = oSteamPunkMaskParent.x;
	y = oSteamPunkMaskParent.y - 26;
	image_alpha = oSteamPunkMaskParent.image_alpha;
	
	if (oSteamPunkMaskParent.maskOnBlueprint) {
		image_alpha = 1.0;
		image_index = 1;
	}
}