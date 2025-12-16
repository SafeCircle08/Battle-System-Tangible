var _optionList = global.playerEquippedOptions;
var _optionNumber = array_length(_optionList);
var _h = 20
var _w = 65;

//Sub Menu Button Pos
setSubMenuPositions(
	(room_width / 2) - 48, 
	(room_height / 2 - 20) - ((_h * (_optionNumber - 2)) + 5 * (_optionNumber - 2)) - 6
);
	
var _bgH = 25;
var _xBorder = 17;
var _yBorder = 4;
var _bgW = 80;
var _buttonY = room_height / 4 - 12;
var _goalButtonX = 0;
var _sprButton = sLittleRectangle;
var _buttonW = sprite_get_width(_sprButton);
var _buttonH = sprite_get_height(_sprButton);

var _bgSpr = global.selectedGuiStyle.bg;
drawFadeInSprite(sSelectArrow, subMenuX - 49, subMenuY + (_bgH * _optionNumber) / 2, subMenuAlpha, subMenuXAdder);
drawFadeInSpriteStretched(_bgSpr, subMenuX - 49, subMenuY, subMenuAlpha, subMenuXAdder, _bgW, _bgH * _optionNumber);
drawFadeInSprite(global.enemyPortrait, subMenuX - 49 + _bgW / 2, subMenuY + 3, subMenuAlpha, subMenuXAdder);	
	
draw_set_alpha(subMenuAlpha);
draw_set_font(fMonoNotMono);

//Draws the secondary options (BUTTONS)
for (var i = 0; i < _optionNumber; i++) {
	var _btnSpr = global.selectedGuiStyle.buttons;
	var _btnX = subMenuX + _xBorder - 58;
	var _btnY = subMenuY + (_h * i + 1 * i) + _yBorder + 2;
	var _index = 0;
	draw_set_color(c_white);
	if (i == oBattleManager.selected_option) { 
		_index = 1; 
		draw_set_color(global.selectedGuiStyle.selectionColor);
	} 
	var _textSprite = global.playerEquippedOptions[i].textSprite;
	draw_sprite_ext(_btnSpr, _index, _btnX + subMenuXAdder, _btnY, 1, 1, 0, c_white, subMenuAlpha);
	draw_sprite(_textSprite, 0, _btnX + subMenuXAdder, _btnY);
}
draw_set_alpha(1);