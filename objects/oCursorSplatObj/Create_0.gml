goAwayTimer = 0;

startXScale = 0;
startYScale = 0;
startAlpha = 0;
finalXScale = 0;
finalYScale = 0;
scaleXAmount = 0;
scaleYAmount = 0;
alphaAmount = 0;
startAlpha = 0;
finalAlpha = 0;

scaleSign = 0;
alphaSign = 0;

setScaleVars = function (
	_startScaleX = 1, _startScaleY = 1, _finalScaleX = 0, 
	_finalScaleY = 0, _scaleXAmount = 0.005, _scaleYamount = _scaleXAmount,
) {
	startXScale = _startScaleX; 
	startYScale = _startScaleY;
	finalXScale = _finalScaleX;
	finalYScale = _finalScaleY;
	scaleXAmount = _scaleXAmount;
	scaleYAmount = _scaleYamount;
}

setAlphaVars = function(_startA = 1, _finalA = 0, _aAmount = 0.005) {
	startAlpha = _startA;
	finalAlpha = _finalA;
	alphaAmount = _aAmount;
}

setUpFadeOutTimer = function(_fadeOutTimerAmount = irandom_range(50, 200)) {
	goAwayTimer = _fadeOutTimerAmount;
}

customMethod = function() {};

setUpCustomFunction = function(_function) {
	customMethod = _function;
}

goUp = false;
spdValue = 0;

makeSplatGoUp = function(_spd) { 
	goUp = true; 
	spdValue = _spd;
}

goingUp = function(_spd = spdValue, _exp = false) {
	if (_exp) {
		timer += 0.05;
		y -= _spd * timer;
		return;
	}
	y -= _spd;
	return;
}