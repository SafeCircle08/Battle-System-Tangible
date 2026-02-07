if (!isInBulletHellSection()) {
	#region VARIABLES
	var guiX = room_width / 2;
	var guiY = room_height;
	var _sprTextBox = setToGuiTxtBoxSelectedTheme();
	var _textBoxW = sprite_get_width(_sprTextBox);
	var _textBoxH = sprite_get_height(_sprTextBox) + 5;
	var _battleFont = Mono;
	var fontSize = font_get_size(_battleFont);
	var	BUFFER = 12;
	draw_set_font(_battleFont);

	var _dsBgW = sprite_get_width(_sprTextBox);
	var _dsBgH = sprite_get_height(_sprTextBox);
	var _dsX = camera_get_view_x(view_camera[view_current]);
	var _dsY = camera_get_view_height(view_camera[view_current]);
	var _border = 10;
	
	#endregion
	
	#region DRAWING PLAYER HP & CAGE STATE
	//Draws the player variables
	draw_set_font(fHungryBig);
	var _playerInfoX = BUFFER - 8;
	var _playerInfoY = guiY - (_textBoxH) - 13;
	
	draw_set_colour(c_black);
	draw_rectangle(0, _playerInfoY, room_width, _playerInfoY + 15, false);
	
	//Hp
	draw_set_colour(playerHpTextColor);
	draw_text(_playerInfoX, _playerInfoY, "HP:" + string(global.playerHP) + "/" + string(global.playerMAX_HP));
	draw_set_color(c_white);
	
	//Cage State
	var _csX = _playerInfoX + (10 * BUFFER) -35;
	var _csY = _playerInfoY + 3;
	var _barCsW = 121;
	var _barCsH = 10;
	draw_text(_csX, _playerInfoY, "CS: ");
	draw_sprite(sCSBarBG, 0, _csX + 22, _csY);
	draw_sprite_stretched(sCSBar, 0, _csX + 22, _csY, (global.CSvalue/global.CSvalueMax) * _barCsW, _barCsH);
	
	//Gold
	var _goldStr = string(global.playerGold);
	var _strL = string_length(_goldStr);
	var _goldX = _csX + _barCsW + 32 - (2 * _strL - 3);
	draw_text(_goldX, _playerInfoY, string(global.playerGold) + "$");
	
	#endregion
	
	#region DRAWING ENEMY INFO
	//Draws the monster variables
	var _enemyInfoX = _csX + 60;
	var _enemyInfoY = _playerInfoY + 5;
	draw_set_color(c_red);
	draw_text_ext_transformed(_enemyInfoX + 40, _enemyInfoY, "(" + string(global.monsterHP) + "/" + string(global.maxMonsterHp) + ")", 5, 100, 0.5, 0.5, 0);
	draw_set_color(c_white);
	#endregion
	
	#region DRAWING MAIN MENU
	draw_set_font(fMonoNotMono);
	var _bgW = 80;
	var _buttonX = startButtonX;
	var _buttonY = room_height / 4 - 12;
	var _goalButtonX = 0;
	var _sprButton = setToGuiButtonsSelectedTheme();
	var _buttonW = sprite_get_width(_sprButton);
	var _buttonH = sprite_get_height(_sprButton);
	
	//Button BG
	var _mainBgW = (_buttonW * 2) + 7;
	var _mainBgHeightScale = 4;
	var _mainBgH = (_buttonH * _mainBgHeightScale) + 15;
	var _bg = setToGuiBgSelectedTheme();
	draw_sprite_stretched(_bg, 0, _buttonX - 50, _buttonY - 5, _mainBgW, _mainBgH);
	//Mini player portrait
	draw_sprite_ext(global.selectedGuiTheme.miniPortrait, 0, _buttonX + 40, _buttonY - 2, 1, 1, 0, c_white, 1);
	
	if (!showActionsFlavourText) { drawMenuButtons(_sprButton, _buttonX, _buttonY); }
	
	#endregion
	
	#region	DRAWING THE INVENTORY
	if (inventoryAlpha > 0 ) {
		draw_set_alpha(inventoryAlpha);
		
		var _itemWidth = sprite_get_width(sItemSprite);
		var _inventoryX = INVENTORY_X;
		var _inventoryY =  INVENTORY_Y;
		
		var _sprBG = setToGuiBgSelectedTheme();
		_bgW = sprite_get_width(_sprBG) * 3;
		_bgH = sprite_get_height(_sprBG) * 2;

		//Draws the inventory BackGround
		draw_sprite_stretched(_sprBG, 0, _inventoryX + inventoryXAdder, _inventoryY, _bgW, _bgH);
		
		//Draws the Inventory Mini Portrait (can an inventory have a portrait?, Idk lol)
		draw_sprite(global.selectedGuiTheme.inventoryPortrait, 0, _inventoryX + _bgW - 30 + inventoryXAdder, _inventoryY + 3)
		
		//Draws the inventory space (useless but cool)
		drawInventoryCapacity(_inventoryX, _inventoryY, _border);
		
		//Draws the Item name, properties, info ecc...
		var _spriteBorder = _border - 2;
		var _itemNameX = _inventoryX + _spriteBorder;
		var _itemNameY = _inventoryY + _spriteBorder;
		var _col;
		var j = 0;
		
		for (var i = 0; i < array_length(global.equippedItems); i++) {
			var _item = global.equippedItems[i];
			if (thisItemIsSelected(i)) {
				var _itemSprX = _inventoryX + _bgW - _itemWidth - _border - 7;
				var _itemSprY = _inventoryY + _border + _border / 2 - 2;
				var _itemSprW = sprite_get_width(sCocoMilk);
				
				drawItemSprite(_item, _itemSprX, _itemSprY);
				drawStatistics(i, _itemSprX, _itemSprY, _border);
				drawEnchants(i, _itemSprX, _itemSprY, _border);
				
				_col = setToSelectionColorSelectedTheme();
			} else { _col = setToGuiTextColorSelectedTheme(); }
			
			draw_set_color(_col); 
			if (_item.enchanted == true) { setEnchantTextCol(i); }
			draw_set_font(fHungrySkinny);
			j = drawItemsNames(_item, _itemNameX + inventoryXAdder, _inventoryX, _itemNameY, _border, i, j);
		}
		
		var _itemInfoBgX = _inventoryX + _border;
		var _itemInfoBgY = _inventoryY + (_bgH / 2);	
		var _infoBorder = 3;
		var _itemInfoX = _itemInfoBgX - _border / 2;
		var _itemInfoY = _itemInfoBgY - 2;
		
		drawItemTextBox(_itemInfoX, _itemInfoBgY, _bgW, _bgH, _border, _infoBorder);
		drawAndManageBattleBook(_inventoryX, _itemInfoBgY, _bgW, _border);
	
		draw_set_alpha(1);
	}
	#endregion
}
else {
	#region DRAWING PLAYER WHILE IN BULLET HELL SECTION

	var _blackBaseX = 0;
	var _blackBaseY = room_height;
	var _blackBaseW = room_width;
	var _blackBaseH = 40;
	
	var _barsBorder = 5;
	var _hpBarW = (room_width / 2) - (_barsBorder * 2);
	var _hpBarH = 7;
	var _shieldBarW = _hpBarW; 
	var _shieldBarH = _hpBarH;
	
	var _hpBarX = _barsBorder;
	var _hpBarY = room_height - _barsBorder * 2;
	var _shieldBarX = _hpBarX + _hpBarW + _barsBorder * 2;
	var _shieldBarY = _hpBarY;
	var _segnaliniX = undefined;
	var _segnaliniY = undefined;
	
	draw_sprite_stretched(sWhiteRectangle, 0, _hpBarX - 2, _hpBarY - 2, room_width - (_barsBorder * 2) + 4, _hpBarH + 4);
	draw_sprite_stretched(sHealthBar, 0, _hpBarX, _hpBarY, (global.playerHP/global.playerMAX_HP) * _hpBarW, _hpBarH);
	draw_sprite_stretched(sShieldBar, 0, _shieldBarX, _shieldBarY, (global.playerShield/global.playerMaxShield) * _shieldBarW, _shieldBarH);
	
	var _font = Mono;
	draw_set_font(_font);
	draw_set_halign(fa_center);
	draw_set_colour(playerHpTextColor);
	
	var _hpTextX = _hpBarX + (_hpBarW / 2);
	var _hpTextY = _hpBarY - (_barsBorder * 3);
	draw_text(_hpTextX, _hpTextY, "HP: " + string(global.playerHP) + " / " + string(global.playerMAX_HP));
	
	draw_set_halign(fa_left);
	
	#endregion
}

draw_set_color(c_white);