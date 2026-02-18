//QUESTO OGGETTO SERVE A FARE IN MODO CHE OGNI GENERATOR
//ALLA FINE DEL TURNO VENGA "DISTRUTTO". 
//MECCANISCMO UGUALE A QUELLO DEL BULLET PARENT.

//Default values
global.xOffset = 0;
global.yOffset = 0;
oSoul.image_angle = 0;

global.boxOriginX = 160;
global.boxOriginY = 100;

increaseBattleBgAlpha = function() {
	if (oBlack.image_alpha < 1) { oBlack.image_alpha += 0.05 }
	if (oPinkDetails.image_alpha < 1) { oPinkDetails.image_alpha += 0.05 }	
}	