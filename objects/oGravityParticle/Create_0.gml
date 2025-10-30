image_xscale = 0.6;
image_yscale = 0.6;
image_alpha = 1;

rotates = false;
rotationSpd = undefined;
fadingOut = false;
fadeOutValue = 0;

setToRotation = function(_rotSpd) {
	rotates = true;
	rotationSpd = _rotSpd;
}

rotationFunc = function() {
	image_angle += rotationSpd;	
}

setToReduceAlpha = function(_fadeOutValue) {
	fadingOut = true;
	fadeOutValue = _fadeOutValue;
}