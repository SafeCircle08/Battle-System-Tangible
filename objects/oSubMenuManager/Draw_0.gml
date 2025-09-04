var _optionList = global.playerEquippedOptions;
var _optionNumber = array_length(_optionList);
var _h = sprite_get_height(sLittleRectangle) / 2;
var _w = sprite_get_width(sLittleRectangle) / 2;

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

drawFadeInSprite(sSelectArrow, subMenuX - 49, subMenuY + (_bgH * _optionNumber) / 2, subMenuAlpha, subMenuXAdder);
drawFadeInSpriteStretched(sInventory, subMenuX - 49, subMenuY, subMenuAlpha, subMenuXAdder, _bgW, _bgH * _optionNumber);
drawFadeInSprite(sSteamPunkMiniPortrait, subMenuX - 49 + _bgW / 2, subMenuY + 3, subMenuAlpha, subMenuXAdder);	
var _options = [];
	
draw_set_alpha(subMenuAlpha);
draw_set_font(fFontino);
//Draws the secondary options (BUTTONS)
for (var i = 0; i < _optionNumber; i++)
{
	//Pushing the right names
	array_push(_options, global.playerEquippedOptions[i].name);
	//Draws the buttons and the text
	var _btnX = subMenuX + _xBorder - 58;
	var _btnY = subMenuY + (_h * i + 1 * i) + _yBorder + 2;
	var _index = 0;
	if (i == oBattleManager.selected_option) { _index = 1; } 
	draw_sprite_ext(sGUIBattleButton, _index, _btnX + subMenuXAdder, _btnY, 1, 1, 0, c_white, subMenuAlpha);
	draw_text(_btnX + _w / 4 - 7 + subMenuXAdder, _btnY + _yBorder + 2, _options[i]);
}
draw_set_alpha(1);
