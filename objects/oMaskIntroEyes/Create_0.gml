image_alpha = 0;

introEyes = function() {
	if (oSteamPunkMaskParent.maskReady == true) {
		image_alpha -= 0.05;
		if (image_alpha <= 0) {
			instance_destroy(self); 
		}
	} else { 
		image_alpha += 0.01;
		image_alpha = clamp(image_alpha, 0, 1);
	}
}