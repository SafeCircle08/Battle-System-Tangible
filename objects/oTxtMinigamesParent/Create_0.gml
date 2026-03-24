actualDotNum = 1;
textInstanceRef = noone;
myBackground = noone;
backGroundCreated = false;

bgX = 0;
bgY = 0;
goalBgX = 0;
goalBgY = 0;

description = "";

ascDotDesc = function() { return "<Pop the Bubbles ins ASC. order>"; }
desDotDesc = function() { return "<Pop the Bubbles in DESC. order>"; }
anyDotDesc = function() { return "<Pop the Bubbles in ANY order>"; }

createBackGround = function(_textInst) {
	bgX = _textInst.txtBoxX;
	bgY = _textInst.txtBoxY;
	goalBgX = bgX;
	goalBgY = bgY - (_textInst.camH / 2);
	
	myBackground = instance_create_layer(bgX, bgY, LAYER_OW_TEXT, oTxtMinigameBackground);
	myBackground.description = description;
	myBackground.startY = bgY;
	myBackground.goalX = goalBgX;
	myBackground.goalY = goalBgY;	
	myBackground.camX = _textInst.camX;
	myBackground.camY = _textInst.camY;
}

setTextInstanceRef = function(_textInst) {
	textInstanceRef = _textInst;
}

createHolders = function() {
	
}

createDot = function(_x, _y, _index = 0, _layer = LAYER_EFFECT_TOP_3) {
	var _dot = instance_create_layer(_x - 5, _y, LAYER_EFFECT_TOP_3, oTxtMinigameDot);
	_dot.dotN = _index;
}

createDots = function(_dotsN = 5) {
	var _y = oCamera.getDims(DIMS.HALF_HEIGHT) + 40;
	for (var i = 0; i < _dotsN; i++) {
		var _x = 50 + (50 * i) - 5;
		createDot(_x, _y, i + 1);
	}
}

checkWin = function() {
		
}

textInstanceRefExists = function() { return instance_exists(textInstanceRef); }

destroyHolder = function() { 
	if (!instance_exists(oTxtMinigamesHolderParent)) return;
	with (oTxtMinigamesHolderParent) { instance_destroy(); }
}

destroyBg = function() { 
	instance_destroy(myBackground); 
}

destroyDot = function(_dot) {
	instance_destroy(_dot);
}

destroyDots = function() {
	if (!instance_exists(oTxtMinigameDot)) return;
	show_debug_message(instance_number(oTxtMinigameDot));
	for (var i = instance_number(oTxtMinigameDot) - 1; i >= 0; i--) {
		var d = instance_find(oTxtMinigameDot, i);
		destroyDot(d);
	}	
}

destroyInstances = function() {
	destroyHolder();
	destroyDots();
}

manageTextInstanceRefInputs = function() {
	with (textInstanceRef) {
		if (morePages(pagesList)) goToNextPage();
		else destroyTextBoxOW(txtBoxX, txtBoxY, false);		
	}
}

endMinigame = function() {
	textInstanceRef.enableHandlingText();
	manageTextInstanceRefInputs();
	destroyInstances();
	myBackground.startDestroyAnimation();
	instance_destroy(myBackground.dark);
	hideCursor();
	instance_destroy(self);
}