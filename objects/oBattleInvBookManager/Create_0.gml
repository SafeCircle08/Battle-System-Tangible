bookBgW = 68;
bookBgH = room_height * 2;
drawAlpha = 0;
PROPS_PER_ROW = 5;

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

drawPropertiesFrame = function() {
	var bookBgX = bookX;
	var bookBgY = bookY;

	var bookBgSpr = setToGuiBgSelectedTheme();

	draw_set_alpha(drawAlpha);

	draw_sprite_stretched(bookBgSpr, 0, bookBgX, bookBgY, bookBgW, bookBgH);		
}

drawPropertyText = function(_x, _y, _index, _yAdder) {
	var _propText = global.propertiesKind[_index][PROPERTY_TEXT_SPRITE];
	draw_sprite(_propText, 0, _x, _y + _yAdder);	
}

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
	
createPropMiniCard = function(_actualProp, _x, _y, _index) {
	var _w = sprite_get_width(sHealProperty);
	var _fx = instance_create_layer(_x + 5 + (_w * (_index - 1) + 1 * (_index - 1)), _y + 5, LAYER_EFFECT_TOP_2, oMiniPropCardFX);
	_fx.sprite_index = _actualProp.sprite;
	_fx.duplicateSprite();
	_fx.setSpriteOffSet();	
}
	
createBattleBookPropDesc = function(_actualProp) {
	var _propDescObj = instance_create_layer(x, y, LAYER_EFFECT_TOP, oBattleInvBookPropDesc);
	_propDescObj.description = _actualProp.desc;
	_propDescObj.detSprite = _actualProp.detailedSprite;
	_propDescObj.enchFx = _actualProp.enchanted;
}	
	
drawMiniProp = function(_actualProp, _x, _y, _index) {
	var _w = sprite_get_width(sHealProperty);
	if (_actualProp.enchanted == true) { setGlintShader(); }
	draw_sprite(_actualProp.sprite, 0, _x + (_w * (_index - 1) + 1 * (_index - 1)), _y);
	shader_reset();		
}
	
	
	
	
	
	
	
	
	
	
	
	