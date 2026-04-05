enum TENNA_SIDE {
	LEFT,
	RIGHT
}

MAX_HITS = 5;
X_OFFSET = 50;
SHAKE_TIMER_REF = 10;

side = TENNA_SIDE.LEFT;
xGoal = 0;
shakeTimer = SHAKE_TIMER_REF;
hittedTimes = 0;
hitFlash = 0;
image_alpha = 0;

deactivating = false;
moving = true;
shaking = false;
deactivated = false;

attachToMaskPos = function(_yOffset = 10) {
	y = oSteamPunkMaskParent.y - _yOffset;	
}
gotHit = function() {
	var _blt = instance_place(x, y, oUmbrellaShotGunBullet);
	if (_blt != noone) return true;
	return false;
}
setUp = function(_side) {
	side = _side;
	
	if (side == TENNA_SIDE.LEFT) {
		xGoal = xstart - X_OFFSET;
		image_xscale = -1;
	}	else {
		xGoal = xstart + X_OFFSET;
		image_xscale = 1;
	}
}
reset = function() {
	closing = false;
	moving = true;
	shaking = false;	
}	
move = function() {
	if (image_alpha < 1.0) image_alpha += 0.05;
	x = lerp(x, xGoal, 0.3);
}
setToDeactivate = function() {
	moving = false;
	deactivating = true;
}
activate = function() {
	deactivated = false;
}
deactivate = function() {
	deactivated = true;	
	reset();
}
stopShaking = function() {
	shakeTimer = SHAKE_TIMER_REF;
	shaking = false;
	x = xGoal;
}
setToShake = function() {
	shakeTimer = SHAKE_TIMER_REF;
	shaking = true;	
}
shake = function() {
	shakeTimer = setTimer(shakeTimer);
	if (shakeTimer > 0) {
		var _xRange = 5;
		var _yRange = 5;
		var _xAdder = irandom_range(-_xRange, _xRange);
		var _yAdder = irandom_range(-_yRange, _yRange);
		x += _xAdder;
		y += _yAdder;
		return;
	}
	stopShaking();
}
isActive = function() {
	return !deactivated;	
}
deactivate = function() {
	if (image_alpha > 0.0) image_alpha -= 0.05;
	var returnX = xGoal - X_OFFSET;
	if (side == TENNA_SIDE.LEFT) returnX = xGoal + X_OFFSET;
	x = lerp(x, returnX, 0.3);
	if (abs(x - returnX) < 0.1) { 
		instance_destroy(self);
		if (side == TENNA_SIDE.LEFT) oSteamPunkMaskParent.leftTenna = undefined;
		else oSteamPunkMaskParent.rightTenna = undefined;
	}
}