bookBgW = 68;
bookBgH = room_height * 2;
drawAlpha = 0;

//X Coords
bookStartX = room_width;
bookFinalX = room_width - bookBgW;
bookX = bookStartX;
startXRef = bookStartX;
finalXRef = bookFinalX;

//Y Coords
bookStartY = 0;
bookFinalY = bookBgH;
bookY = bookStartY;
startYRef = bookStartY;
finalYRef = bookFinalY;

bookInitYRef = bookStartY;

//Animations
fadeInDone = false;
fadingOut = false;
scrollingAmount = 7;
hovering = false;

setToFadeOut = function() {
	fadingOut = true;
	fadeInDone = true;
}

setToFadeIn = function() {
	fadingOut = false;
	fadeInDone = false;
}

destroyPropCards = function() {
	if (instance_exists(oMiniPropCardFX_out)) { instance_destroy(oMiniPropCardFX_out); }
	if (instance_exists(oMiniPropCardFX)) { instance_destroy(oMiniPropCardFX); }
}

isFading = function() {
	return (fadingOut);	
}

fadeInFunc = function(alphaAdd, xAdd) {
	if (drawAlpha < 1) {
		drawAlpha += alphaAdd;
		bookX -= xAdd;
	} else { fadeInDone = true; }
	drawAlpha = clamp(drawAlpha, 0, 1);
	bookX = clamp(bookX, finalXRef, startXRef);
}

fadeOutFunc = function(alphaAdd, xAdd) {
	if (drawAlpha > 0) {
		drawAlpha -= alphaAdd;
		bookX += xAdd;			
	} else {
		instance_destroy(self);
	}
	drawAlpha = clamp(drawAlpha, 0, 1);
	bookX = clamp(bookX, finalXRef, startXRef);
}

isScrolling = function() {
	var yRef = bookInitYRef;
	var _actualBookY = bookY;
	bookInitYRef = bookY;
	return (yRef != _actualBookY)
}

scrollingParentFunc = function() {
	if (isScrolling()) {
		destroyPropCards();
	}
}

scrollingBookUp = function(upWheelAmount = scrollingAmount) {
	scrollingParentFunc();
	bookY += upWheelAmount;
	bookY = clamp(bookY, -bookBgH, 0);
}	

scrollingBookDown = function(upWheelAmount = scrollingAmount) {
	scrollingParentFunc();
	bookY -= upWheelAmount;
	bookY = clamp(bookY, -bookBgH / 2, bookBgH);
}