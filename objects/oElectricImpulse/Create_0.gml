sparkTimerRef = 2;
sparkTimer = sparkTimerRef;
sparkN = 0;

positivePoleRef = undefined; //the instance
negativePoleRef = undefined;

distX = 0;//abs(positivePoleRef.x - negativePoleRef.x);
distY = 0;

electricTravelledDist = 0;

playerX = 0;
playerY = 0;
destPlayerX = 0;
destPlayerY = 0;

xCounter = 0;
yCoutner = 0;

isPositiveAbove = function() {
	if (positivePoleRef.y < negativePoleRef.y) { return true; }
	return false;
};

isPositiveLeft = function() {
	if (positivePoleRef.x < negativePoleRef.x) { return true; }
	return false;
};

isVertical = function() {
	if (abs(positivePoleRef.x - negativePoleRef.x) == 0) {
		return true;
	}	
	return false;
}