if (!isInBulletHellSection())
{
	#region VARIABLES
	var guiX = room_width / 2;
	var guiY = room_height;
	var _sprTextBox = sNewBox;
	var _textBoxW = sprite_get_width(_sprTextBox);
	var _textBoxH = sprite_get_height(_sprTextBox);
	var _battleFont = Mono;
	var fontSize = font_get_size(_battleFont);
	var	BUFFER = 12;
	draw_set_font(_battleFont);
	#endregion
	
	#region DRAWING FLAVOUR TEXT && ENEMY SPEECH
	var _dsBgW = sprite_get_width(_sprTextBox);
	var _dsBgH = sprite_get_height(_sprTextBox);
	var _dsX = camera_get_view_x(view_camera[view_current]);
	var _dsY = camera_get_view_height(view_camera[view_current]);
	var _border = 10;
	
	if (showFlavourText) && (!isEnemySpeaking()) { 
		drawTextBoxText(flavourText, Mono, true, ord("Z"), true, true, sndBasicTxt5, 0, 0); 
	}
	
	if (isEnemySpeaking()) { 
		drawTextBoxText(
			global.textList[turnNumber], fHungrySkinny, false, global.confirmTextKey, 
			true, true, sndSteamPunkTalk, 10, 5, 10, 8, 20, 
			sprite_get_width(sTextBoxBg) - 10, 0.5, 
			183, 35, true
		); 
	}
	#endregion
	
	#region DRAWING PLAYER HP, CAGE STATE
	//Draws the player variables
	draw_set_font(fHungryBig);
	var _playerInfoX = BUFFER - 8;
	var _playerInfoY = guiY - (_textBoxH) - 12;
	
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
	var _bgH = 25;
	var _xBorder = 17;
	var _yBorder = 4;
	var _bgW = 80;
	var _buttonY = room_height / 4 - 12;
	var _goalButtonX = 0;
	var _sprButton = sLittleRectangle;
	var _buttonW = sprite_get_width(_sprButton);
	var _buttonH = sprite_get_height(_sprButton);
	
	//Button BG
	draw_sprite_stretched(global.selectedGuiStyle.bg, 0, startButtonX - 50, _buttonY - 5, _buttonW / 2 + 71.5, _buttonH * 2 + 15);
	//Mini player portrait
	draw_sprite_ext(global.selectedGuiStyle.miniPortrait, 0, startButtonX + 40, _buttonY - 2, 1, 1, 0, c_white, 1);
	
	if (!showFlavourText)
	{
		increaseMainMenuXPos();	
		for (var i = 0; i < array_length(mainOptionsNames); i++)
		{
			draw_set_color(c_white);
			//Draws the button
			var _index = 0;
			if (playerMainActionTurn())
			{
				if (selected_option == i) { 
					_index = 1;
					draw_set_color(global.selectedGuiStyle.selectionColor);
				};
			}
			var _y = _buttonY + 21 * i;
			var _x = startButtonX;
			
			//Actual button
			draw_sprite(global.selectedGuiStyle.buttons, _index, _x, _y);
			
			//Button Properties (name, deco, ecc...)		
			var text = global.settedMainBattleOptions[i].name;
			var _textSprite = global.settedMainBattleOptions[i].textSprite;
			draw_sprite(global.selectedGuiStyle.decoBg, _index, _x + 66, _y + 2); //deco bg
			draw_sprite(global.settedMainBattleOptions[i].decoSprite, _index, _x + 66, _y + 2); //actual deco
			var textX = startButtonX;
			var textY = (_buttonY + 5) + (_buttonH / 2 + 1) * i - 5.5;
			var _nameL = string_length(text)
			draw_sprite(_textSprite, 0, textX, textY);
		}
		drawTextBoxText(writtenBattleText, Mono, false, ord("Z"), true, true, sndBasicTxt5, 0, 0);
	}
	else { decreaseMainMenuXPos(); }
	#endregion
	
	#region	DRAWING THE INVENTORY
	if (inventoryAlpha > 0 )
	{
		draw_set_alpha(inventoryAlpha);
		
		var _itemWidth = sprite_get_width(sItemSprite);
		var _border = 10;
		var _inventoryX = INVENTORY_X;
		var _inventoryY =  INVENTORY_Y;
		
		var _sprBG = global.selectedGuiStyle.bg;
		var _bgW = sprite_get_width(_sprBG) * 3;
		var _bgH = sprite_get_height(_sprBG) * 2;

		//Draws the inventory BackGround
		draw_sprite_stretched(_sprBG, 0, _inventoryX + inventoryXAdder, _inventoryY, _bgW, _bgH);
		
		//Draws the Inventory Mini Portrait (can an inventory have a portrait?, Idk lol)
		draw_sprite(global.selectedGuiStyle.inventoryPortrait, 0, _inventoryX + _bgW - 30 + inventoryXAdder, _inventoryY + 3)
		
		//Draws the inventory space (useless but cool)
		draw_set_font(fHungryBig);
		var _invCapacity = string(array_length(global.equippedItems)) + "/" + string(MAX_ITEMS_NUM);
		draw_set_color(c_black);
		draw_text(_inventoryX + _border * 3 + inventoryXAdder + 1, _inventoryY - _border + 1, _invCapacity);
		draw_set_color(c_white);
		draw_text(_inventoryX + _border * 3 + inventoryXAdder, _inventoryY - _border, _invCapacity);
		draw_set_font(fHungrySkinny);
		
		//Draws the Item name, properties, info ecc...
		var _spriteBorder = _border - 2;
		var _itemNameX = _inventoryX + _spriteBorder;
		var _itemNameY = _inventoryY + _spriteBorder;
		var j = 0;
		
		for (var i = 0; i < array_length(global.equippedItems); i++)
		{
			var _item = global.equippedItems[i];
			if (thisItemIsSelected(i)) 
			{
				//Sprite Coords
				var _itemSprX = _inventoryX + _bgW - _itemWidth - _border - 7;
				var _itemSprY = _inventoryY + _border + _border / 2 - 2;
				var _itemSprW = sprite_get_width(sCocoMilk);
				//Drawing the sprite with enchant effect if needed
				if (_item.enchanted == true) { setGlintShader(); }
				draw_sprite(_item.sprite, 0, _itemSprX + inventoryXAdder, _itemSprY);
				shader_reset();
				drawStatistics(i, _itemSprX, _itemSprY, _border);
				drawEnchants(i, _itemSprX, _itemSprY, _border);
				draw_set_color(global.selectedGuiStyle.selectionColor); 
			}
			else { draw_set_color(c_white); }
			
			if (_item.enchanted == true) { setEnchantText(i); }
			
			var scale = 0.5;
			var sep = 0.5;
			var w = 50;
			
			//Left Side
			if (i < 4) {
				draw_text_ext_transformed(_itemNameX + inventoryXAdder, _itemNameY + _border * i, _item.name, sep, w, scale, scale, 0);
				shader_reset();
				continue;
			}
			//Right Side
			_itemNameX = _inventoryX + _border + string_width("PNE") + 5;
			draw_text_ext_transformed(_itemNameX + inventoryXAdder, _itemNameY + _border * j, _item.name, sep, w, scale, scale, 0);
			shader_reset();
			j++;
		}
		
		var _itemInfoBgX = _inventoryX + _border;
		var _itemInfoBgY = _inventoryY + (_bgH / 2);	
		var _infoBorder = 3;
		var _itemInfoX = _itemInfoBgX - _border / 2;
		var _itemInfoY = _itemInfoBgY - 2;
		
		draw_sprite_stretched(sItemInfoBG, 0, _itemInfoX + inventoryXAdder, _itemInfoY, _bgW - _border, _bgH / 2 + _border / 2 - _border);
		
		//Draws the item properties
		if (!instance_exists(itemOutputMessage)) {	
			var scale = 0.5;
			var sep = 0.5;
			var w = 50;
			draw_set_color(c_white);
			var _info = itemInfo(selected_option);
			var _finalMessage;
			if (is_array(_info)) { _finalMessage = _info[0]; }
			else { _finalMessage = _info; }
			draw_text_ext_transformed(_itemInfoX + _infoBorder * 2 + inventoryXAdder,  _itemInfoBgY + _border / 2, _finalMessage, 20, 200, scale, scale, 0);
		}

		var _itemInfoBgY = _inventoryY + (_bgH / 2);
		var _bookSpr = global.selectedGuiStyle.itemStatsBook;
		var _bookW = sprite_get_width(_bookSpr);
		var _bookH = sprite_get_height(_bookSpr);
		var _bookX = _inventoryX + _bgW - _bookW - _border;
		var _bookY = _itemInfoBgY + _border / 2 + 1.5;
		var _bookSubImg = 0;
		
		var _mX = _bookX + inventoryXAdder;
		var _mY = _bookY;
		var _mW = _mX +_bookW;
		var _mH = _mY + _bookH;
		
		if (mouseCursorIsOn(_mX, _mY, _mW, _mH)) {
			_bookSubImg = 1;
			if (mouse_check_button_pressed(mb_left) && (decidingSubAction == true)) {
				if (!instance_exists(oBattleInvBookManager)) { openBattleBook(); }
				else { 
					if (oBattleInvBookManager.isFading() == true) { reOpenBattleBook(); }
					else { closeBattleBook();  }
				}
			}
		}
		draw_sprite(_bookSpr, _bookSubImg, _bookX + inventoryXAdder, _bookY - 2);
		draw_set_alpha(1);
	}
	#endregion
}
else
{
	#region DRAWING PLAYER INFO DURING TURN

	var _blackBaseX = 0;
	var _blackBaseY = room_height;
	var _blackBaseW = room_width;
	var _blackBaseH = 40;
	
	/*
	draw_set_color(c_black);
	draw_rectangle(_blackBaseX, _blackBaseY - _blackBaseH, _blackBaseW, _blackBaseY, false);
	draw_set_color(c_white);
	*/
	
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