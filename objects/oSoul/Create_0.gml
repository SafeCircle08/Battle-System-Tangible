key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S")) 
key_jump = keyboard_check_pressed(vk_space);
key_jumpPressed = keyboard_check(vk_space);

damageTaken = 0;
startX = x;
startY = y;

image_xscale = 1;
image_yscale = 1;

segnalini = [];

setToDefaultPos = function(_defPosX = room_width / 2, _defPosY = -20) {
	x = _defPosX;
	y = _defPosY;
}

setToDefaultPos();

setToSlide = function(_iceFrictionValue) { 
	iceFriction = _iceFrictionValue;
	isSliding = true;
}

removeSlide = function() { 
	iceFriction = DEFAULT_FRIC;
	isSliding = false; 
}

drawBeamAnimation = function() {
	with (oPlayerBeam) {
		var _xOffset = 16;
		beamHeight = clamp(beamHeight, 1, room_height + 1);
		indexMax += 0.28 * (delta_time / 1_000_000) * WANTED_FPS;
		draw_sprite_stretched(sBeam, indexMax, oSoul.x - _xOffset , 0, sprite_get_width(sBeam), beamHeight);
	}	
}

basicPlayerVars();

beamTimerVars();
shaderVars();

stateFreeLoad();
stateMirroredLoad();
stateUmbrellaLoad();
stateUsingUmbrella();
stateGravityLoad();
stateSpiderLoad();
stateCartingLoad();
stateCircuitLoad();

loadPlayerStateInfo();

selectedState = global.playerStateFree;
state = stateFree;