if (drawAlpha < MAX_DRAW_ALPHA) drawAlpha += 0.05;
if (mouseIsHovering()) {
	calculateTransitionedValues(MAX_RADIUS, MAX_FREQ_SPD, MAX_STAR_POWER);
	exit;
} else calculateTransitionedValues(MIN_RADIUS, MIN_FREQ_SPD, MIN_STAR_POWER);

t += delta_time / 1_000_000;
y = y_0 + sin(t * 2) * yMaxAmp;
x = x_0 + cos(t * 0.5) * xMaxAmp;