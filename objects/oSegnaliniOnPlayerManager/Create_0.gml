image_alpha = 0;

x = oSoul.x;
y = oSoul.y;

rotations = 3
targetAngle = image_angle + 360 * rotations;

segnaliniOnPlayerCards = [];
segnaliniOnPlayer = [];
segnaliniN = 0


startXScale = 0;
startYScale = 0;
finalXScale = 1;
finalYScale = 1;
scaleAmount = 0.03;

image_xscale = startXScale;
image_yscale = startYScale;

startAlpha = 0;
finalAlpha = 0.5;
drawAlpha = 0;
finalDrawAlpha = 1;
alphaAmount = 0.01;
frame = 0;

delayForDestroying = 20;

increaseDrawAlpha = function() {
	if (drawAlpha < finalDrawAlpha) {
		drawAlpha += alphaAmount;	
		drawAlpha = clamp(drawAlpha, 0, 1);
	}
}

decreaseDrawAlpha = function() {
	if (drawAlpha > 0) {
		drawAlpha -= alphaAmount * 5;	
		drawAlpha = clamp(drawAlpha, 0, 1);
	}	
}

rotationFunc = function() {
	if (image_angle < targetAngle - 0.1) {
		image_angle = lerp(image_angle, targetAngle, 0.1);
	} else {
		image_angle = targetAngle;	
	}		
}

managerHasNoSegnalini = function() {
	return (segnaliniN == 0);	
}

canShowInBoxSegnalini = function() {
	return (oBattleManager.isInBulletHellSection()) && (beamAnimationEnded());
}

createCirclesDeco = function() {
	instance_create_layer(x, y, LAYER_EFFECT_TOP, oBigCircleDeco);	
}

createCirclesDeco();

initializeFadeInOutVars(true, false);