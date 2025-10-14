if (frame > 0) { frame = setTimer(frame); }

if (frame <= 0) {
	changeAlphaValue(1, 0, -0.05)
	changeDimension(1, 1, 5, 5, 0.07, 0.07, true);
	if (rotates) {
		rotationFrame += rotationFrameAmount;
		rotation(rotationAmount);
	}
}