var bookBgX = bookX;
var bookBgY = bookY;

var bookBgSpr = global.selectedGuiStyle.bg;

draw_set_alpha(drawAlpha);

draw_sprite_stretched(bookBgSpr, 0, bookX, bookBgY, bookBgW, bookBgH);
var _yAdder = 0;

var hoovering = false;

//Draws the text
for (var i = 0; i < array_length(global.propertiesKind); i++)
{
	var _miniPropBorder = 7;
	var _miniPropW = sprite_get_width(sHealProperty);
	var _miniPropH = sprite_get_height(sHealProperty);
	var _propTextX = bookX + (bookBgW / 2);
	var _propTextY = bookY + 10;
	
	var _propsPerRow = 5;
	var _rowsOfProps = ceil((array_length(global.propertiesKind[i]) - 1) / _propsPerRow);
	var z = 1;
	
	var _propText = global.propertiesKind[i][PROPERTY_TEXT_SPRITE];
	draw_sprite(_propText, 0, _propTextX, _propTextY + _yAdder);
	
	//Draws the actual mini props 
	for (var j = 0; j < _rowsOfProps; j++)
	{
		var _miniPropX = bookX + _miniPropBorder;
		var _miniPropY = _propTextY + _miniPropBorder * 2 + (_miniPropH * j + 1 * j) + _yAdder;
		z = 1;
		
		for (var k = 1 + 5 * j; k < 6 + 5 * j; k++)
		{
			if (
			    mouse_x > _miniPropX + (_miniPropW * (z - 1) + 1 * (z - 1)) &&
			    mouse_x < _miniPropX + (_miniPropW * (z - 1) + 1 * (z - 1)) + 10 &&
			    mouse_y > _miniPropY &&
			    mouse_y < _miniPropY + 10
			)
			{
				hoovering = true;
				
				//Creates the FX
				if (!instance_exists(oMiniPropCardFX)) {
					var _fx = instance_create_layer(_miniPropX + 5 + (_miniPropW * (z - 1) + 1 * (z - 1)), _miniPropY + 5, LAYER_EFFECT_TOP_2, oMiniPropCardFX);
					_fx.sprite_index = global.propertiesKind[i][k].sprite;
					_fx.duplicateSprite();
					_fx.setSpriteOffSet();
				}
				
				if (!instance_exists(oBattleInvBookPropDesc)) {
					var _propDescObj = instance_create_layer(x, y, LAYER_EFFECT_TOP, oBattleInvBookPropDesc);
					_propDescObj.description = global.propertiesKind[i][k].desc;
					_propDescObj.detSprite = global.propertiesKind[i][k].detailedSprite;
				}	
			}
				
			//Drawing the mini prop
			if (_miniPropY > 0 && _miniPropY < 210)
			{
				var _actualProp = global.propertiesKind[i][k];
				if (_actualProp.enchanted == true) { setGlintShader(); }
				draw_sprite(_actualProp.sprite, 0, _miniPropX + (_miniPropW * (z - 1) + 1 * (z - 1)), _miniPropY);
				shader_reset();
			}
		
			z += 1;
			if (k >= array_length(global.propertiesKind[i]) - 1) { break; }
		}
	}
	_yAdder += 11 + 5 + (_rowsOfProps * 10 + 5);
	shader_reset();
}

if (hoovering == false) {
	if (instance_exists(oBattleInvBookPropDesc)) {
		instance_destroy(oBattleInvBookPropDesc);
	}
	if (instance_exists(oMiniPropCardFX)) {
		oMiniPropCardFX.changeToFadeOut();
	}
}	
draw_set_alpha(1);
