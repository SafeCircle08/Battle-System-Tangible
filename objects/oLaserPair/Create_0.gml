angle = 0;
timerRef = 200;
timer = timerRef;

height = 3;
image_yscale = height;

createsLaserFXs = [];

isInAGroup = true;

startOver = function(_addValue = 0) {
	timer = timerRef + _addValue;	
}

stopTimer = function() {
	timer = -1;	
}

createChargingFX = function() {
	var _fx1 = instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oLaserChargeFX);	
	_fx1.callingLasers = self;
	_fx1.image_yscale = height / 2;
	_fx1.image_angle = image_angle;
}

createShootFX = function() {
	var _fx = instance_create_layer(x, y, LAYER_EFFECT_TOP, oChangeAlphaDimObjFX);
	_fx.sprite_index = sLaserPairFX;
	_fx.image_angle = image_angle;
	_fx.setUpVars(image_xscale, image_yscale, image_xscale * 3, image_yscale * 3, 0.05, 0.05, 1, 0, -1, 0.05);		
}

createLaser = function() {
	//Initialize the Laser Instance
	var _myLaser = instance_create_layer(x, y, LAYER_BULLETS, oLaserInstance);
	_myLaser.creator = self;
	
	//Define Sprite dimensions constants
	var _laserPairSpr = sLaserPair;
	var _laserPairSprH = sprite_get_height(_laserPairSpr);
	var _laserN = 2;
	var _laserPieceH = 12;
	var _pixelAdd = 2;
	var _laserDist = (
		(_laserPairSprH * height) - 
		(_laserPieceH * 2) + 
		(_pixelAdd * 2)
	);
	
	//Set the right scale and angle
	_myLaser.image_yscale = _laserDist / 2;
	_myLaser.image_angle = self.image_angle;
}

shootLaser = function() {
	createShootFX();
	createLaser();
}