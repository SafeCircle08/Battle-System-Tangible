image_alpha = 0;
time_uniform = shader_get_uniform(shd_StarBubble, "u_time");
radius_uniform = shader_get_uniform(shd_StarBubble, "u_radius");
freqSpd_uniform = shader_get_uniform(shd_StarBubble, "u_freqSpd");
starPower_uniform = shader_get_uniform(shd_StarBubble, "u_starPower");
alpha_uniform = shader_get_uniform(shd_StarBubble, "u_alpha");

bubbleW = 80;
bubbleH = 80;
bubbleSurf = -1;

MAX_RADIUS = 0.5;
MIN_RADIUS = 0.4;
bubbleRadius = MIN_RADIUS;

MAX_FREQ_SPD = 10.0;
MIN_FREQ_SPD = 3.0;
freqSpd = MIN_FREQ_SPD;

MAX_STAR_POWER = 5.0;
MIN_STAR_POWER = 1.0;
starPower = MIN_STAR_POWER;

MAX_DRAW_ALPHA = 0.9;
drawAlpha = 0;

dotN = 0;
t = irandom_range(0, 90);
y_0 = ystart;
x_0 = xstart;
yMaxAmp = irandom_range(1.5, 5.0);
xMaxAmp = irandom_range(1.5, 7.0);

mouseIsHovering = function() {
	return position_meeting(mouse_x, mouse_y, self);
}

calculateTransitionedValues = function(r, f, starP) {
	var v = 0.2;
	bubbleRadius = lerp(bubbleRadius, r, v);
	freqSpd = f;
	starPower = lerp(starPower, starP, v);	
}