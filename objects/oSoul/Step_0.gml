key_right = keyboard_check(ord(global.keyBinds.right)); 
key_left = keyboard_check(ord(global.keyBinds.left)); 
key_up = keyboard_check(ord(global.keyBinds.up));
key_down = keyboard_check(ord(global.keyBinds.down));

global.playerHP = clamp(global.playerHP, 0, global.playerMAX_HP);

if (keyboard_check(vk_alt) && (keyboard_check_pressed(ord("C")))) {
	if (!instance_exists(oDeveloperCommandsManager)) {
		instance_create_layer(x, y, LAYER_EFFECT_TOP_4, oDeveloperCommandsManager);
		disableGameInputs();
	} else {
		if (oDeveloperCommandsManager.activeCMD == true) {
			oDeveloperCommandsManager.activeCMD = false;
			instance_deactivate_object(oDeveloperCommandsManager);
		} else {
			instance_deactivate_object(oDeveloperCommandsManager);	
			oDeveloperCommandsManager.activeCMD = true;
		}
	}
}

if (keyboard_check_pressed(ord("V"))) {
	terminateBattle(rm_Intro);
	exit;
}

if (!inBulletHell()) exit;

if (beamAnimationIsActive()) {
	if (beamAnimationFirstFrame() && !beamAnimationFinalAnimationIsActive()) setToStartTurnX();
	global.beamAnimationTimer--;
	if (beamAnimationFinalAnimationIsActive()) { 
		if (beamAnimationFirstFrameFinalAnimation()) setToDefaultPos();
		exit; 
	} else {
		if (beamAnimationTimerIsEqualTo(15)) setToActualTurnPosition();
		if (beamAnimationOnEnding()) canState = true; 
	}
}

if (canState == true) state();

/*
if (keyboard_check_pressed(ord("M"))) {
	removeSegnalini();
}