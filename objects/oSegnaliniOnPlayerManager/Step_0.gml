frame++;

x = lerp(x, oSupportPlayerhitbox.x - 1, 0.2);
y = lerp(y, oSupportPlayerhitbox.y, 0.2);

if (canShowInBoxSegnalini()) {
	if (fadingIn) {
		rotationFunc();
		fade(
			startXScale, startYScale, 
			finalXScale, finalYScale,
			scaleAmount, scaleAmount,  false, 
			startAlpha, finalAlpha,
			alphaAmount, false);
	}
	else {
		fade(
			finalXScale, finalYScale,
			startXScale, startYScale,
			-scaleAmount, -scaleAmount, true,
			finalAlpha, startAlpha, 
			-alphaAmount, true);
	}
} else {
	if (image_angle != 0) {
		image_angle = 0;	
	}
	fade(
		finalXScale, finalYScale,
		startXScale, startYScale,
		-scaleAmount, -scaleAmount, false,
		finalAlpha, startAlpha, 
		-alphaAmount, false);
}