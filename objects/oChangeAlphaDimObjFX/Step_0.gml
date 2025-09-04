if (frame > 0) { frame = setTimer(frame); }
if (frame == 0) {
	changeAlphaValue(startAlpha, finalAlpha, -alphaAmount)
	changeDimension(startXScale, startYScale, finalXScale, finalYScale, scaleAmount);
	if (rotates) { rotation(rotationAmount); }
}