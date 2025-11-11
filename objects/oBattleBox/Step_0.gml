x = global.boxOriginX;
y = global.boxOriginY;

if (visible = false) {
	timer = 0;
	angleAdder = 1;
	animateBoxTimer = 50;
	currentWidth = 50;
	currentHeight = 50;
	drawAlpha = 0;
} 
else { 
	var _alphaValue = 0.01;
	if (!turnIsEnding()) {
		if (drawAlpha < 1) { drawAlpha += _alphaValue; }
		if (animateBoxTimer > 0 ) { animateBoxTimer--; } 
	} else {
		if (drawAlpha > 0) { drawAlpha -= 0.02;  } 
	}
}

if (animateBoxTimer == 0) {	
	var _divideTo = 20;
	if (!turnIsEnding()) {
		increaseBorders(_divideTo);
	} else { decreaseBorders(_divideTo); }
}

print(drawAlpha);