x = global.boxOriginX;
y = global.boxOriginY;

if (visible == false) exit;

var _alphaValue = 0.01;
if (!turnIsEnding()) {
	if (drawAlpha < 1) { drawAlpha += _alphaValue; }
	if (animateBoxTimer > 0 ) { animateBoxTimer--; } 
} else {
	if (drawAlpha > 0) { drawAlpha -= 0.02;  } 
}


if (animateBoxTimer <= BOX_START_ANIM_TIMER_CHECK && !boxAnimationFinished()) {	
	var _divideTo = 20;
	if (!turnIsEnding()) {
		increaseBorders(_divideTo);
	} else { decreaseBorders(_divideTo); }
}