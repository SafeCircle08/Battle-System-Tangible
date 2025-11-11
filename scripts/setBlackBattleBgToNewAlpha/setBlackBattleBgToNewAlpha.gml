function setBlackBattleBgToNewAlpha(_newMaxAlpha, _newMinAlpha = -1) {
	if (instance_exists(oBlack)) {
		oBlack.maxAlpha = _newMaxAlpha;
		oBlack.minAlpha = _newMinAlpha;
	} else { show_error("Black Bg Does not exist...", true); }
}