attachToPlayerMovement();

if (fadingIn) { changeAlphaValue(0, 1, 0.05, false); }
else { 
	changeAlphaValue(1, 0, -0.05, true); 
}