actualDotNum = 1;
textInstanceRef = noone;
myBackground = noone;
backGroundCreated = false;

bgX = 0;
bgY = 0;
goalBgX = 0;
goalBgY = 0;

createBackGround = function(_textInst) {
	bgX = _textInst.txtBoxX;
	bgY = _textInst.txtBoxY;
	goalBgX = bgX;
	goalBgY = bgY - (_textInst.camH / 2);
	
	myBackground = instance_create_layer(bgX, bgY, LAYER_OW_TEXT, oTxtMinigameBackground);
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

createDots = function() {
	
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

destroyInstances = function() {
	destroyHolder();
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