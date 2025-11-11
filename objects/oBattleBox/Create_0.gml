visible = false;
currentWidth = 0;
currentHeight = 0;
animateBoxTimer = 50;
draw = true;
drawAlpha = 0;
timer = 0;

//Default values
global.boxOriginX = 160;
global.boxOriginY = 75;
global.border_u = 0;
global.border_d = 0;
global.border_l = 0;
global.border_r = 0;

decreaseBorders = function(_divideTo, _amount = 5) {
	if (currentWidth > BATTLE_BOX_BASE_W) { currentWidth -= _amount; }	
	if (currentWidth < BATTLE_BOX_BASE_W) { currentWidth += _amount; }	
	if (currentHeight > BATTLE_BOX_BASE_H) { currentHeight -= _amount; }	
	if (currentHeight < BATTLE_BOX_BASE_H) { currentHeight += _amount; }
}

increaseBorders = function(_divideTo) {
	var _w = global.borderWidth;
	var _h = global.borderHeight;
	if (currentWidth < _w) { currentWidth += ((_w - currentWidth) / _divideTo); }	
	if (currentWidth > _w) { currentWidth -= ((currentWidth - _w) / _divideTo); }	
	if (currentHeight < _h) { currentHeight += ((_h - currentHeight) / _divideTo); }	
	if (currentHeight > _h) { currentHeight -= ((currentHeight - _h) / _divideTo); }		
}