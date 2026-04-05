isReloading = false;

reloadTime = 0;
shootTimer = 0;
SHOOT_DELAY_REF = 10;
shootDelay = SHOOT_DELAY_REF;
shooting = false;
pressedShoot = false;
RELOAD_TIME_REF = 80;
bufferedPress = false;

ACCEPT_DELAY_TIMER = 20;

xAdder = 0;
yAdder = 0;

canTakeBufferedPress = function() {
	return ((mouse_check_button_pressed(mb_left) && pressedShoot = true) && reloadTime > RELOAD_TIME_REF - ACCEPT_DELAY_TIMER);	
}

resetCoordsAdder = function() {
	xAdder = 0;
	yAdder = 0;		
}

canTakeMouseLeftPressed = function(_alsoPressed = true) {
	if (_alsoPressed) return (mouse_check_button_pressed(mb_left) || mouse_check_button(mb_left)) && pressedShoot == false;
	else return mouse_check_button_pressed(mb_left) && pressedShoot == false;
}	

shotBullets = function(_bulletsN = 3, _angle = 5) {
	instance_create_layer(x, y - 13, LAYER_EFFECT_TOP_3, oUmbrellaShotGunSmoke);	
	playSound(sndUmbrellaShoot, SOUND_CHANNEL_1);
	oCamera.shake(2);

	var _refAngle = 90;
	var _startAngle = _refAngle + _angle;
	for (var i = 0; i < _bulletsN; i++) {
		_blt = instance_create_layer(x, y, LAYER_EFFECT_TOP_2, oUmbrellaShotGunBullet);
		_blt.image_angle = _startAngle - (_angle * i);
	}
}

resetReloading = function() {
	isReloading = false;
	shootDelay = SHOOT_DELAY_REF;
	pressedShoot = false;
	reloadTime = 0;	
}	

goReloading = function() {
	isReloading = true;
	shootDelay = -1;
	bufferedPress = false;
}

resetShooting = function() {
	shootTimer = 0;
	shooting = false;
}

shoot = function() {
	shootTimer++;
	
	if (shootTimer == 1) shotBullets();
	
	if (shootTimer > 0 && shootTimer < 5) {
		yAdder = lerp(yAdder, 2, 0.3);
	}
	if (shootTimer > 5 && shootTimer < SHOOT_DELAY_REF) {
		yAdder = lerp(yAdder, 0, 0.3);	
	}
	if (shootTimer >= SHOOT_DELAY_REF) {
		resetCoordsAdder();
		resetShooting();
	}
}

reload = function() {
	reloadTime++;
	if (reloadTime > 0 && reloadTime < 30) {
		image_angle = lerp(image_angle, 50.0, 0.1);
	}
	
	if (reloadTime > 30 && reloadTime < 35) {
		xAdder = lerp(xAdder, 2, 0.9);
		yAdder = lerp(yAdder, 2, 0.9);
		if (reloadTime == 31) { 
			createGravityParticles(sUmbrellaBulletPopping, LAYER_EFFECT_TOP_2, 1, x, y, 1.0);
			playSound(sndUmbrellaReload, SOUND_CHANNEL_2);
			playSound(sndPop, SOUND_CHANNEL_1);
		}
	}
	
	if (reloadTime > 35 && reloadTime < 45) {
		xAdder = lerp(xAdder, -1, 0.9);
		yAdder = lerp(yAdder, -1, 0.9);			
	}
	
	if (reloadTime > 45 && reloadTime < RELOAD_TIME_REF) {
		xAdder = lerp(xAdder, 0, 0.9);
		yAdder = lerp(yAdder, 0, 0.9);
		image_angle = lerp(image_angle, 0, 0.1);
	}
	
	if (reloadTime >= RELOAD_TIME_REF) {
		resetReloading();
		resetCoordsAdder();
		image_angle = 0;
	}
}