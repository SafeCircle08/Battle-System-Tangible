key_right = keyboard_check(ord("D")); 
key_left = keyboard_check(ord("A")); 
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

global.playerHP = clamp(global.playerHP, -666, global.playerMAX_HP);

if (keyboard_check(vk_alt) && (keyboard_check_pressed(ord("C")))) {
	if (!instance_exists(oDeveloperCommandsManager)) {
		instance_create_layer(x, y, LAYER_EFFECT_TOP_4, oDeveloperCommandsManager);
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

if (!oBattleManager.isInBulletHellSection()) { exit; }

//I am animating the beam
if (beamAnimationIsActive()) {
	global.beamAnimationTimer--;
	global.beamAnimation = true; //-> playerBeamAnimation();
}

if (beamAnimationFinalAnimationIsActive()) { 
	if (global.enemyTimer == global.enemyAttackTime - BEAM_ANIMATION_TIMER_REF + 1) { setToDefaultPos(); }
	exit; 
}

if (beamAnimationTimerIsEqualTo(5)) { setPlayerPos(global.boxOriginX, global.boxOriginY); }

if (beamAnimationLastFrame()) { 
	createPlayerStateEffect(selectedState.effectSpr);
}

if (beamAnimationOnEnding()) { state(); }

/*
if (keyboard_check_pressed(ord("M"))) {
	removeSegnalini();
}