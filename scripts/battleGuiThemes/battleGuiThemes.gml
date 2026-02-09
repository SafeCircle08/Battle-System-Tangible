global.selectedGuiTheme = undefined;
global.portraitIndex = undefined;

function loadEnemyPortrtaitsThemes() {
	var _portraitsList = [];
	for (var i = 0; i < argument_count; i++) {
		_portraitsList[i] = argument[i];
	}
	return _portraitsList;
}

function impostGuiTheme(_theme) {
	global.selectedGuiTheme = _theme;
}

function createNewGuiTheme (
	_basicBG, _buttons, _txtBox, 
	playerPortrait, _inventoryPortrait, _enemyPortrait,
	_statisticsBook, _decoBg, _systemEnchBg, _selectedColor, 
	_textColor = c_white, _bgTextCol = c_dkgrey
	//enchantment system bg, 
	/*
		Ogni volta che si crea una nuova "meccanica" GUI,
		bisognera inserire la sua "blueprint" qui
	*/
) {
	var _newGuiSet = { 
		bg: _basicBG,
		buttons: _buttons,
		textBox: _txtBox,
		inventoryPortrait: _inventoryPortrait,
		enemyPortrait: _enemyPortrait,
		miniPortrait: playerPortrait,
		itemStatsBook: _statisticsBook,
		decoBg: _decoBg,
		systemEnchBg: _systemEnchBg,
		selectionColor: _selectedColor,
		textColor: _textColor,
		textBgCol: _bgTextCol
	}

	return _newGuiSet;
}

global.theme_ORANGE = createNewGuiTheme(
	sGUI_BackGround_ORANGE,
	sGUI_BattleButton_ORANGE,
	sGUI_TextBox_lights_ORANGE,
	sGUI_PlayerMiniPortrait_ORANGE,
	sGUI_InventoryMiniPortrait_ORANGE,
	sGUI_EnemyPortrait_ORANGE,
	sGUI_ItemStatisticsBook_ORANGE,
	sGUI_DecoBg_ORANGE,
	sGUI_EnchantSystemBg_ORANGE,
	c_custom_yellow
);

global.theme_NIGHT_VISION = createNewGuiTheme(
	sGUI_BackGround_NIGHT_VISION,
	sGUI_BattleButton_NIGHT_VISION,
	sGUI_TextBox_NIGHT_VISION,
	sGUI_PlayerMiniPortrait_NIGHT_VISION,
	sGUI_InventoryMiniPortrait_NIGHT_VISION,
	sGUI_EnemyPortrait_NIGHT_VISION,
	sGUI_ItemStatisticsBook_NIGHT_VISION,
	sGUI_DecoBg_NIGHT_VISION,
	sGUI_EnchantSystemBG_NIGHT_VISION,
	c_custom_night_red
);

global.theme_SUMMER = createNewGuiTheme(
	sGUI_BackGround_SUMMER,
	sGUI_BattleButton_SUMMER,
	sGUI_TextBox_SUMMER,
	sGUI_PlayerMiniPortrait_SUMMER,
	sGUI_InventoryMiniPortrait_SUMMER,
	sGUI_EnemyPortrait_SUMMER,
	sGUI_ItemStatisticsBook_SUMMER,
	sGUI_DecoBg_SUMMER,
	sGUI_EnchantSystemBg_SUMMER,
	c_summer_selection_color
);

global.theme_VINTAGE_COOKIE = createNewGuiTheme(
	sGUI_BackGround_VINTAGE_COOKIE,
	sGUI_BattleButton_VINTAGE_COOKIE,
	sGUI_TextBox_lights_VINTAGE_COOKIE,
	sGUI_PlayerMiniPortrait_VINTAGE_COOKIE,
	sGUI_InventoryMiniPortrait_VINTAGE_COOKIE,
	sGUI_EnemyPortrait_VINTAGE_COOKIE,
	sGUI_ItemStatisticsBook_VINTAGE_COOKIE,
	sGUI_DecoBg_VINTAGE_COOKIE,
	sGUI_EnchantSystemBg_VINTAGE_COOKIE,
	c_vintage_cookie_selection_color,
	c_vintage_cookie_txt_color,
	c_vintage_cookie_bg_txt_color
);

impostGuiTheme(global.theme_SUMMER);