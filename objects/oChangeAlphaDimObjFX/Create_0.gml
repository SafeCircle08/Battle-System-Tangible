startXScale = 0;
startYScale = 0;
finalXScale = 0;
finalYScale = 0;
startAlpha = 1;
finalAlpha = 0;

alphaSign = 1; //positive ->add / negative -> remove
alphaAmount = 0;

scaleSign = 1;
scaleAmount = 0;

rotates = false;
rotationFrame = 0;
rotationFrameAmount = 0.7;
rotationAmount = 0;
frame = 0;

sprite_index = sBandagesItem;
image_speed = 0;

isTimed = true;

rotation = function(_rotAmount) {
	rotationFrame += 0.5;
	image_angle += 	_rotAmount * (rotationFrame / 3);
}

setUpScaleVars = function(_startX, _startY, _finalX, _finalY, _sign, _amount)
{
	startXScale = _startX;
	startYScale = _startY;
	finalXScale = _finalX;
	finalYScale = _finalY;
	scaleSign = _sign;
	scaleAmount = _amount;
	image_xscale = startXScale;
	image_yscale = startYScale;
}	
setUpAlphaVars = function(_startA, _finalA, _sign, _amount)
{
	startAlpha = _startA;
	finalAlpha = _finalA;
	alphaSign = _sign;
	alphaAmount = _amount;
	image_alpha = startAlpha;
}

setUpVars = function (
	_startX, _startY, _finalX, _finalY, _signScale, _amountScale, 
	_startA, _finalA, _signAlpha, _amountAlpha
)
{
	setUpScaleVars(_startX, _startY, _finalX, _finalY, _signScale, _amountScale);
	setUpAlphaVars(_startA, _finalA, _signAlpha, _amountAlpha);
}
setUpGravity = function(_grv, _hspd, _vspd)
{
	gravity = _grv;
	hspeed = _hspd;
	vspeed = _vspd;
}