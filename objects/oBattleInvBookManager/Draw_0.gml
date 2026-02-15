drawPropertiesFrame();

var _yAdder = 0;
var hoovering = false;

//Draws the text
for (var i = 0; i < array_length(global.propertiesKind); i++) {
	var _miniPropBorder = 7;
	var _miniPropSpr = sHealProperty;
	var _miniPropW = sprite_get_width(_miniPropSpr);
	var _miniPropH = sprite_get_height(_miniPropSpr);
	var _propTextX = bookX + (bookBgW / 2);
	var _propTextY = bookY + _miniPropH;
	
	drawPropertyText(_propTextX, _propTextY, i, _yAdder);
	
	var _rowsOfProps = ceil((array_length(global.propertiesKind[i]) - 1) / PROPS_PER_ROW);
	var z = 1;
	
	//Draws the actual mini props 
	for (var j = 0; j < _rowsOfProps; j++) {
		var _miniPropX = bookX + _miniPropBorder;
		var _miniPropY = _propTextY + _miniPropBorder * 2 + (j * (_miniPropH + 1)) + _yAdder;
		var _border = 1;
		z = 1;
		
		for (var k = _border + (PROPS_PER_ROW * j); k < (PROPS_PER_ROW + _border) + (PROPS_PER_ROW * j); k++) {	
			var _mPropX = _miniPropX + ((z - _border) * (_miniPropW + _border));
			var _mPropY = _miniPropY;
			var _mPropW = _miniPropX + ((z - _border) * (_miniPropW + _border)) + _miniPropW;
			var _mPropH = _miniPropY + _miniPropW;
			var _actualProp = global.propertiesKind[i][k];
			
			if (mouseCursorIsOn(_mPropX, _mPropY, _mPropW, _mPropH, true)) {
				hoovering = true;
				if (!instance_exists(oMiniPropCardFX)) createPropMiniCard(_actualProp, _miniPropX, _miniPropY, z);
				if (!instance_exists(oBattleInvBookPropDesc)) createBattleBookPropDesc(_actualProp);
			}
			
			if (_miniPropY > 0 && _miniPropY < 210) drawMiniProp(_actualProp, _miniPropX, _miniPropY, z); 
		
			z += 1;
			if (k >= array_length(global.propertiesKind[i]) - 1) { break; }
		}
	}
	_yAdder += 11 + 5 + (_rowsOfProps * 10 + 5);
	shader_reset();
}

if (hoovering == false) {
	if (instance_exists(oBattleInvBookPropDesc)) instance_destroy(oBattleInvBookPropDesc);
	if (instance_exists(oMiniPropCardFX)) {
		if (!isFading()) 
			oMiniPropCardFX.changeToFadeOut(); 
		else 
			instance_destroy(oMiniPropCardFX);
	}
}	
draw_set_alpha(1);