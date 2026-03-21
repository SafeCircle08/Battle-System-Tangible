function startHandShakeTextMinigame(_textInst) {
	_textInst.disableHandlingText();
	showCursor();
	var _minigame = instance_create_layer(0, 0, LAYER_OW_INSTANCES, oTxtMinigame_HandShake);
	_minigame.setTextInstanceRef(_textInst);
	_minigame.createBackGround(_textInst);
}