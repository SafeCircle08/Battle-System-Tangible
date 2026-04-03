isReloading = false;

reloadTime = 0;
shootTimer = 0;
SHOOT_DELAY_REF = 10;
shootDelay = SHOOT_DELAY_REF;
shooting = false;
pressedShoot = false;

xAdder = 0;
yAdder = 0;

resetCoordsAdder = function() {
	xAdder = 0;
	yAdder = 0;		
}

mouseLeftPressed = function(_alsoPressed = true) {
	if (_alsoPressed) return (mouse_check_button_pressed(mb_left) || mouse_check_button(mb_left)) && pressedShoot == false;
	else return mouse_check_button_pressed(mb_left) && pressedShoot == false;
}	

resetReloading = function() {
	isReloading = false;
	shootDelay = SHOOT_DELAY_REF;
	pressedShoot = false;
	reloadTime = 0;	
}	

resetShooting = function() {
	shootTimer = 0;
	shooting = false;
}

shoot = function() {
	shootTimer++;
	if (shootTimer > 0 && shootTimer < 5) {
		yAdder = lerp(yAdder, 2, 0.3);
	}
	if (shootTimer > 5 && shootTimer < 10) {
		yAdder = lerp(yAdder, 0, 0.3);	
	}
	if (shootTimer > SHOOT_DELAY_REF) {
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
		if (reloadTime == 31) createGravityParticles(sUmbrellaBulletPopping, LAYER_EFFECT_TOP_2, 1, x, y, 1.0);
	}
	
	if (reloadTime > 35 && reloadTime < 45) {
		xAdder = lerp(xAdder, -1, 0.9);
		yAdder = lerp(yAdder, -1, 0.9);			
	}
	
	if (reloadTime > 45 && reloadTime < 80) {
		xAdder = lerp(xAdder, 0, 0.9);
		yAdder = lerp(yAdder, 0, 0.9);
		image_angle = lerp(image_angle, 0, 0.1);
	}
	
	if (reloadTime > 80) {
		resetReloading();
		resetCoordsAdder();
		image_angle = 0;
	}
}