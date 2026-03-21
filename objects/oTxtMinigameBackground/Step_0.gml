if (onEnding == true) {
	destroyinAnimation();
	exit;		
}

y = lerp(y, goalY, 0.1);
oDark.image_alpha += 0.03;
oDark.image_alpha = clamp(oDark.image_alpha, 0, 0.6);