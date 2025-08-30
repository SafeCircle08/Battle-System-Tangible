goAwayTimer = setTimer(goAwayTimer);

if (goAwayTimer == 0) {
	changeDimension(startXScale, startYScale, finalXScale, finalYScale, scaleXAmount, scaleYAmount);
	changeAlphaValue(startAlpha, finalAlpha, alphaAmount);
	customMethod();
	if (goUp) { goingUp(3, true); }
}
