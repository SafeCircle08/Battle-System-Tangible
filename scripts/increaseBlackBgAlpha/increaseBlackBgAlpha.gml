function increaseBlackBgAlpha(_amount = 0.05) { 
	if (!instance_exists(oBlack)) { show_error("Black Bg Does not exist...", true); }
	with (oBlack) {
		image_alpha += _amount;
		image_alpha = clamp(image_alpha, minAlpha, maxAlpha);
	}
}