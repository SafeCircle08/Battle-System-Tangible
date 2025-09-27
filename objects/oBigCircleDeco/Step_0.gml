if (!instance_exists(oSegnaliniOnPlayerManager)) { exit; }

x = oSegnaliniOnPlayerManager.x;
y = oSegnaliniOnPlayerManager.y;
image_angle += angleAdder;

if (oSegnaliniOnPlayerManager.canShowInBoxSegnalini()) {
	if (fadingIn) {
		changeAlphaValue(0, finalAlpha, alphaAmount, false);
	} else {
		changeAlphaValue(finalAlpha, 0, -alphaAmount, true);	
	}
} else {
	changeAlphaValue(finalAlpha, 0, -alphaAmount, false);
}