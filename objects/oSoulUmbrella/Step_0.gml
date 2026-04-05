x = oSupportPlayerhitbox.x + xAdder;
y = oSupportPlayerhitbox.y - 5 + yAdder;

if (canTakeBufferedPress()) bufferedPress = true; 
if (canTakeMouseLeftPressed()) pressedShoot = true;

if ((pressedShoot == true || bufferedPress == true)) {
	if (bufferedPress == true) pressedShoot = true;
	if (shootDelay > 0) {
		shoot();	
		shootDelay -= 1;
	}
}
if (shootDelay == 0) goReloading(); 
if (isReloading) reload();