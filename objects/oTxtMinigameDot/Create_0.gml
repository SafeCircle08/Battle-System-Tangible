image_alpha = 1;
time_uniform = shader_get_uniform(shd_StarBubble, "u_time");
radius_uniform = shader_get_uniform(shd_StarBubble, "u_radius");
freqSpd_uniform = shader_get_uniform(shd_StarBubble, "u_freqSpd");
starPower_uniform = shader_get_uniform(shd_StarBubble, "u_starPower");
alpha_uniform = shader_get_uniform(shd_StarBubble, "u_alpha");

color1_uniform = shader_get_uniform(shd_StarBubble, "u_color1");
color2_uniform = shader_get_uniform(shd_StarBubble, "u_color2");

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

MAX_HOVERED_DELAY = 1;
hoveredDelay = MAX_HOVERED_DELAY;
hoveringTime = 0;

dx = bubbleW / 2;
dy = bubbleH / 2;

drawX = x - dx;
drawY = y - dy;

lerping = false;

dragging = false;
drag_offset_x = 0;
drag_offset_y = 0;

mouseIsHovering = function() {
	return position_meeting(mouse_x, mouse_y, self);
}

updateRefXYPos = function(_newXRef, _newYRef) {
    x_0 = _newXRef;
    y_0 = _newYRef;
}

calculateTransitionedValues = function(r, f, starP) {
	var v = 0.2;
	bubbleRadius = lerp(bubbleRadius, r, v);
	freqSpd = f;
	starPower = lerp(starPower, starP, v);	
}

clampPositions = function() {
	var _maxX_w = 50;
	var _maxY_w = 50;
	x = clamp(x, x_0 - _maxX_w, x_0 + _maxX_w);
	y = clamp(y, y_0 - _maxY_w, y_0 + _maxY_w);
}