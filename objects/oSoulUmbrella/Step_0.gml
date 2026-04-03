x = oSupportPlayerhitbox.x + xAdder;
y = oSupportPlayerhitbox.y - 5 + yAdder;

if (mouseLeftPressed()) {
	pressedShoot = true;
	oCamera.shake(2);
	instance_create_layer(x, y - 13, LAYER_EFFECT_TOP_3, oUmbrellaShotGunSmoke);
}

if (pressedShoot == true && shootDelay > 0) {
	shoot();
	shootDelay -= 1;
}

if (shootDelay == 0) {
	isReloading = true;
	shootDelay = -1;
}

if (isReloading) reload();