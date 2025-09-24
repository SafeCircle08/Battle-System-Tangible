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

beamAnimationOnEnding = function() {
	return (global.beamAnimationTimer < BEAM_ANIMATION_TIMER_REF / 2);
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

state = stateFree;

loadPlayerStateInfo();