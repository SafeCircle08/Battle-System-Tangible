battleDelay = 3;

subMenuX = 0;
subMenuY = 0;
subMenuXAdder = 0;
subMenuAlpha = 0;

xAdder = 0;
xAdderAdder = 7;
xAdderRef = 60;
drawAlphaAdder = 0.05;

fadingIn = true;
fadedIn = false;
fadingOut = false;

setSubMenuPositions = function(_x, _y)
{
	subMenuX = _x;
	subMenuY = _y;
}

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
	var _maxXAdder = xAdderRef;
	if (subMenuXAdder < xAdderRef) { subMenuXAdder += xAdderAdder; }
	if (subMenuAlpha < 1) { subMenuAlpha += drawAlphaAdder; }
	if (subMenuXAdder == _maxXAdder) && (subMenuAlpha == 1) { fadedIn = true; }
	subMenuXAdder = clamp(subMenuXAdder, 0, xAdderRef);
}
fadeOut = function() {
	if (subMenuXAdder > 0) { subMenuXAdder -= xAdderAdder; }
	if (subMenuAlpha > 0) { subMenuAlpha -= drawAlphaAdder; }
	if (subMenuAlpha <= 0) { instance_destroy(self); }
	subMenuXAdder = clamp(subMenuXAdder, 0, xAdderRef);
}