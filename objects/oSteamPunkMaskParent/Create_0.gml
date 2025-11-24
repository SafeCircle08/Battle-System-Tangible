goalY = (room_height / 2) - 65;

x = room_width / 2;
y = -50;

sprite_index = sSteamPunkMaskIdle;
image_alpha = 0;
image_speed = 0;

//maskEyes = instance_create_layer(x, y, LAYER_EFFECT_TOP_2, oMaskIntroEyes);

maskFrame = 0;
maskReady = false;
maskOnIdle = false;
maskOnFadingOut = false;

maskSetBaseState = function() {
	maskOnIdle = false;
	maskOnFadingOut = false;	
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
		if (y > 20) { image_alpha += 0.05; }
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
}