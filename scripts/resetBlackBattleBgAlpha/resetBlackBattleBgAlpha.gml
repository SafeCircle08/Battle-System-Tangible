function resetBlackBattleBgAlpha() {
	if (instance_exists(oBlack)) {
		oBlack.maxAlpha = oBlack.DEFAULT_MAX_ALPHA;
		oBlack.minAlpha = oBlack.DEFAULT_MIN_ALPHA;
	} else { show_error("Black Bg Does not exist...", true); }
}