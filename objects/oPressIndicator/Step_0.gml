if (keyboard_check_pressed(toPressKey)) {
	instance_destroy(self);	
}

if (fadeOut) {
	image_alpha -= 0.05;
	if (image_alpha <= 0) { instance_destroy(self); }
	exit;
}

if (image_alpha < 1) { image_alpha += 0.05; }