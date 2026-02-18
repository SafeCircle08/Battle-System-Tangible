function __loadBattleManagerDrawingFuncs(){
	drawMenuButtons = function(_sprButton, _buttonX, _buttonY) {
		for (var i = 0; i < array_length(global.settedMainBattleOptions); i++) {
			var _y = _buttonY + 21 * i;
			var _x = _buttonX;
			var _buttonH = sprite_get_height(_sprButton);
			
			draw_sprite(_sprButton, ((selected_option == i) && (playerMainActionTurn())), _x, _y);
			
			var _xOffset = 66;
			var _yOffset = 2;
			var _decoSprBg = global.selectedGuiTheme.decoBg;
			var _decoSpr = global.settedMainBattleOptions[i].decoSprite;
			
			draw_sprite(_decoSprBg, ((selected_option == i) && (playerMainActionTurn())), _x + _xOffset, _y + _yOffset);
			draw_sprite(_decoSpr, ((selected_option == i) && (playerMainActionTurn())), _x + _xOffset, _y + _yOffset);
			
			var textX = _buttonX;
			var textY = (_buttonY + 5) + (_buttonH + 1) * i - 5;
			var _textSprite = global.settedMainBattleOptions[i].textSprite;
			draw_sprite(_textSprite, 0, textX, textY);
		}	
	}
	drawItemSprite = function(_item, _sprX, _sprY) {
		if (_item.enchanted == true) { setGlintShader(); }
		draw_sprite(_item.sprite, 0, _sprX + inventoryXAdder, _sprY); //item sprite
		shader_reset();		
	}
	drawItemTextBox = function(_itemInfoX, _itemInfoY, _bgW, _bgH, _border, _infoBorder) {
		draw_sprite_stretched(sItemInfoBG, 0, _itemInfoX + inventoryXAdder, _itemInfoY, _bgW - _border, _bgH / 2 + _border / 2 - _border);
		if (!instance_exists(itemOutputMessage)) { drawItemDesc(_itemInfoX, _itemInfoY, _infoBorder, _border); }		
	}
	drawItemName = function(_item, _x, _y, _border) {
		var scale = 0.5;
		var sep = 0.5;
		var w = 50;
	
		draw_text_ext_transformed(_x, _y, _item.name, sep, w, scale, scale, 0);
		shader_reset();
	}
	drawItemsNames = function(_item, _itemNameX, _inventoryX, _itemNameY, _border, i, j) {
		if (i < 4) {
			drawItemName(_item, _itemNameX, _itemNameY + _border * i, _border);
		} else {
			_itemNameX = _inventoryX + _border + string_width("PNE") + 5;
			drawItemName(_item, _itemNameX + inventoryXAdder, _itemNameY + _border * j, _border);
			j++;
		}
		return j;
	}	
	drawAndManageBattleBook = function(_x, _y, _bgW, _border) {
		var _bookSpr = setToGuiItemBookSelectedTheme();
		var _bookW = sprite_get_width(_bookSpr);
		var _bookH = sprite_get_height(_bookSpr);
		var _bookX = _x + _bgW - _bookW - _border;
		var _bookY = _y + _border / 2 + 1.5;
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
		draw_sprite(_bookSpr, _bookSubImg, _bookX + inventoryXAdder, _bookY);		
	}
	drawItemDesc = function(_infoX, _infoY, _infoBorder, _border) {
		var sep = 20;
		var w = 200;
		var scale = 0.5;
		var angle = 0;
		draw_set_color(c_white);
		var _info = itemInfo(selected_option);
	
		var _longStringVal = 55;
		var _yPadding = 2;
		if (string_length(_info) >= _longStringVal) { _infoY -= _yPadding; }
	
		var _finalInfoX = _infoX + _infoBorder * 2 + inventoryXAdder;
		var _finalInfoY = _infoY + _border / 2;
	
		draw_text_ext_transformed(_finalInfoX, _finalInfoY, _info, sep, w, scale, scale, angle);		
	}
	drawInventoryCapacity = function(_inventoryX, _inventoryY, _border) {
		draw_set_font(fHungryBig);
		var _invCapacity = string(array_length(global.equippedItems)) + "/" + string(MAX_ITEMS_NUM);
		draw_set_color(c_black);
		draw_text(_inventoryX + _border * 3 + inventoryXAdder + 1, _inventoryY - _border + 1, _invCapacity);
		draw_set_color(c_white);
		draw_text(_inventoryX + _border * 3 + inventoryXAdder, _inventoryY - _border, _invCapacity);
	}
	drawGuiPlayerHp = function(_playerInfoX, _playerInfoY) {
		draw_set_colour(playerHpTextColor);
		draw_text(_playerInfoX, _playerInfoY, "HP:" + string(global.playerHP) + "/" + string(global.playerMAX_HP));
		draw_set_color(c_white);			
	}
	drawGuiCageState = function(_playerInfoX, _playerInfoY) {
		var BUFFER = 12;
		var _csX = _playerInfoX + (10 * BUFFER) - 35;
		var _csY = _playerInfoY + 3;
		var _barCsW = 121;
		var _barCsH = 10;
		draw_text(_csX, _playerInfoY, "CS: ");
		draw_sprite(sCSBarBG, 0, _csX + 22, _csY);
		draw_sprite_stretched(sCSBar, 0, _csX + 22, _csY, (global.CSvalue/global.CSvalueMax) * _barCsW, _barCsH);			
	}
	drawGuiPlayerGold = function(_playerInfoX, _playerInfoY) {
		var BUFFER = 12;
		var _csX = _playerInfoX + (10 * BUFFER) - 35;
		var _csY = _playerInfoY + 3;	
		var _barCsW = 121;
		var _goldStr = string(global.playerGold);
		var _strL = string_length(_goldStr);
		var _goldX = _csX + _barCsW + 32 - (2 * _strL - 3);
		draw_text(_goldX, _playerInfoY, string(global.playerGold) + "$");	
	}
	drawGuiPlayer = function() {
		var guiX = room_width / 2;
		var guiY = room_height;
		var _sprTextBox = setToGuiTxtBoxSelectedTheme();
		var _textBoxW = sprite_get_width(_sprTextBox);
		var _textBoxH = sprite_get_height(_sprTextBox) + 5;
		var _battleFont = Mono;
		var fontSize = font_get_size(_battleFont);
		var	BUFFER = 12;
		var _playerInfoX = BUFFER - 8;
		var _playerInfoY = guiY - (_textBoxH) - 13;	
		
		draw_set_font(fHungryBig);
		draw_set_colour(c_black);
		draw_rectangle(0, _playerInfoY, room_width, _playerInfoY + 15, false);
	
		drawGuiPlayerHp(_playerInfoX, _playerInfoY);
		drawGuiCageState(_playerInfoX, _playerInfoY);
		drawGuiPlayerGold(_playerInfoX, _playerInfoY);
	}		
}