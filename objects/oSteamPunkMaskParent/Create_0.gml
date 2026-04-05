goalY = (room_height / 2) - 60;

x = room_width / 2;
y = -50;

sprite_index = sSteamPunkMaskIdle;
image_alpha = 0;
image_speed = 0;

maskFrame = 0;
maskReady = false;
maskOnIdle = false;
maskOnFadingOut = false;
maskOnBlueprint = false;

core = instance_create_layer(x, y, LAYER_UNDER_EFFECT, oSteamPunkMask_WeakPoint);
getCoreX = function() { return core.x; }
getCoreY = function() { return core.y; }

leftTenna = undefined;
rightTenna = undefined;

maskSetBaseState = function() {
	maskOnIdle = false;
	maskOnFadingOut = false;
	maskOnBlueprint = false;
	image_speed = 0;
}

maskSetIdle = function() {
	maskSetBaseState();
	maskOnIdle = true;
	image_speed = 1;
}

maskIdling = function() {
	maskFrame++;
	var _amplitude = 3;
	y = goalY + sin(maskFrame / 100) * _amplitude;
}

maskEnterIn = function() {
	if (maskReady == false) {
		var _dist = goalY - y;
		var _spdFactor = 0.04;
		y += _dist * _spdFactor;
		if (y > 20 && image_alpha < 1.0) { image_alpha += 0.05; }
		if (image_alpha >= 1) && (y >= goalY - 1) {
			maskReady = true;
			maskSetIdle();
		}
	}
}

maskSetFadingOut = function() {
	maskSetBaseState();
	maskOnFadingOut = true;	
	image_speed = 1;
}

maskFadingOut = function() {
	var _dist = goalY + y;
	var _spdFactor = 0.03;
	y -= _dist * _spdFactor;
	image_alpha -= 0.07;
	if (image_alpha <= 0) { instance_destroy(self); }
	exit;
}

reactivateLeftTenna = function() { leftTenna.activate(); }
reactivateRightTenna = function() { rightTenna.activate(); }
reactivateBothTennas = function() { 
	reactivateLeftTenna();
	reactivateRightTenna();
}

enum TENNA {
	LEFT,
	RIGHT
}

tennaShake = function(_min = 1, _max = 2) {
	oCamera.shake(irandom_range(_min, _max));
}

activateTennaL = function(_shake = false, _yOffset = 10) {
	if (instance_exists(leftTenna) && leftTenna.isActive()) return;
	if (_shake) tennaShake();
	var _maskW = sprite_get_width(sSteamPunkMaskIdle);
	leftTenna = instance_create_layer(x + (_maskW / 2), y - _yOffset, layer, oSteamPunkMaskTenna);
	leftTenna.depth = depth + 1;
	leftTenna.setUp(TENNA_SIDE.LEFT);
}

activateTennaR = function(_shake = false, _yOffset = 10) {
	if (instance_exists(rightTenna) && rightTenna.isActive()) return;
	if (_shake) tennaShake();
	var _maskW = sprite_get_width(sSteamPunkMaskIdle);
	rightTenna = instance_create_layer(x - (_maskW / 2), y - _yOffset, layer, oSteamPunkMaskTenna);
	rightTenna.depth = depth + 1;
	rightTenna.setUp(TENNA_SIDE.RIGHT);
}	

activateBothTennas = function() {
	activateTennaL();
	activateTennaR();
}	

deactivateTenna = function(_tenna, _shake = false) {
	switch (_tenna) {
		case TENNA.LEFT:
			if (!instance_exists(leftTenna) || !leftTenna.isActive()) return;
			leftTenna.setToDeactivate(); 
		break;	
		case TENNA.RIGHT: 
			if (!instance_exists(rightTenna) || !rightTenna.isActive()) return;
			rightTenna.setToDeactivate(); 
		break;	
	}
	if (_shake) tennaShake();
}
deactivateBothTennas = function() {
	deactivateTenna(TENNA.LEFT);
	deactivateTenna(TENNA.RIGHT);
}
	
maskSetOnBlueprint = function() {
	maskSetBaseState();
	maskOnBlueprint = true;
	image_speed = 1.0;
}

maskShowingBlueprint = function() {};