FINAL_XSCALE = 0.4;
FINAL_YSCALE = 0.4;
image_xscale = 0;
image_yscale = 0;
image_speed = 1.0;
image_alpha = 1;

GOAL_Y = y + 10;

shaking = false;
SHAKE_TIMER_REF = 70;
shakeTimer = SHAKE_TIMER_REF;
charging = true;
charged = false;
explodeDelay = 30;

finishCharging = function() {
	charged = true;
	charging = false;	
}

chargingAnimation = function() {
	if (image_alpha < 1.0) image_alpha += 0.05;
	if (image_xscale < 0.4) {
		image_xscale += 0.01;
		image_yscale += 0.01;
	}
	y = lerp(y, GOAL_Y, 0.1);
	if (abs(y - GOAL_Y) < 0.1) {
		finishCharging();
		shaking = true;
	}
}

moving = false;
explode = function() {
	moving = true;
	setMovementVariables();
}

dxPlayer = 0;
dyPlayer = 0;
ray = 0;

h = 0;
k = 0;
a = 0;
t = 0;
t_0 = 40;
curveStr = 0;

setMovementVariables = function() {
	dxPlayer = x - oSoul.x;
	dyPlayer = y - oSoul.y;
	h = 0;
	k = 0;
	a = sign(dxPlayer);
	t_0 = irandom_range(30, 50);
	curveStr = choose(0.005, 0.003, 0.007, 0.01);
}

movement = function() {
	t++;
	x = xstart + (curveStr * ((t - t_0)*(t - t_0) - (t_0 * t_0)) * a * -1);
	y = lerp(y, GOAL_Y - dyPlayer, 0.05);
}

shake = function() {
	shakeTimer = setTimer(shakeTimer);
	if (shakeTimer > 0) {
		var _xRange = 1;
		var _yRange = 1;
		var _xAdder = irandom_range(-_xRange, _xRange);
		var _yAdder = irandom_range(-_yRange, _yRange);
		x = xstart + _xAdder;
		y = GOAL_Y + _yAdder;
		return;
	}
	shaking = false;
	explode();
}