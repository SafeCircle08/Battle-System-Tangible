if (initialized == true) {
	var _cardW = sprite_get_width(sSegnalinoCardBase);
	var _cardH = sprite_get_height(sSegnalinoCardBase);
	var _border = 10;

	var _sprSegXOffset = 33;
	var _sprSegYOffset = 2;

	draw_sprite(baseCardSpr, 0, x, y);
	draw_sprite(segSprite, 0, x - _sprSegXOffset, y - _sprSegYOffset);

	var _topCardY = y - 1;
	var _levelBorder = 6;
	var _levelX = x - (_cardW / 2) + (_levelBorder * 2);
	
	//The level
	draw_sprite(levelSpr, levelSprIndex, _levelX + 2, _topCardY);
	//The type
	draw_sprite(typeSpr, typeSprIndex, _levelX + 20, _topCardY);
	
	draw_set_font(fHungrySkinny);
	draw_text_transformed(x - (_cardW / 2) + 15, y, name, 0.5, 0.5, 0);
}