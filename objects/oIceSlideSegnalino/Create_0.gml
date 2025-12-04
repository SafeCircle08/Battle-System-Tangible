// Inherit the parent event
event_inherited();

segnalinoSprite = sFrozenProperty;
createSegnalino(segnalinoSprite);

removeRealSegnalino = function() {
	destroySegnalino();
	oSoul.removeSlide();
}