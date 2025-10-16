// Inherit the parent event
if (!oSoul.beamAnimationOnEnding()) { exit; }

darkTimer = setTimer(darkTimer);

if (darkTimer > 0) {
	if (oBattleManager.isInBulletHellSection()) {
		if (!instance_exists(oDarkVision)) {
			instance_create_layer(oSoul.x, oSoul.y, LAYER_EFFECT_TOP_3, oDarkVision);	
		}
	} else {
		if (instance_exists(oDarkVision)) {
			oDarkVision.setToFadeOut();
		}
	}
} else { 
	if (instance_exists(oDarkVision)) {
		oDarkVision.setToFadeOut();
	}
	destroySegnalino();
}