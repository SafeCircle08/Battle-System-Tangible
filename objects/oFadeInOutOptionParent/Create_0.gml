startX = 0;
actualX = startX;
actualY = MAIN_BATTLE_MENU_Y;
finalX = 0;
xAdder = 7;

startAlpha = 0;
actualAlpha = startAlpha;
finalAlpha = 1;
alphaAdder = 0.05;

fadingIn = true;
fadedIn = false;
fadingOut = true;

setTofadeIn = function()
{
	fadingOut = false;
	fadedIn = false;
	fadingIn = true;
}

setToFadeOut = function()
{
	battleDelay = 3;
	fadedIn = true;
	fadingOut = true;		
}

fadeIn = function() {
	var _maxXAdder = finalX;
	if (actualX < _maxXAdder) { actualX += xAdder; }
	if (actualAlpha < finalAlpha) { actualAlpha += alphaAdder; }
	if (actualX == _maxXAdder) && (actualAlpha == finalAlpha) { fadedIn = true; }
	actualX = clamp(actualX, 0, finalX);
}
fadeOut = function() {
	if (xAdder > 0) { xAdder -= xAdder; }
	if (actualAlpha > 0) { actualAlpha -= alphaAdder; }
	if (actualAlpha <= 0) { instance_destroy(self); }
	actualX = clamp(actualX, 0, finalX);
}