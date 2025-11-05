event_inherited();

poisonFreq = 100;

//@OVERRIDE SECTION ------------------------------
segnalinoSprite = sPoisoningProperty;
createSegnalino(segnalinoSprite);

removeRealSegnalino = function() {
	destroySegnalino();	
}