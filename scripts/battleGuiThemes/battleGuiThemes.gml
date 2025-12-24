global.selectedGuiTheme = undefined;
global.portraitIndex = undefined;

enum GUI_THEMES {
	ORANGE,
	NIGHT_VISION
}

function loadEnemyPortrtaitsThemes() {
	var _portraitsList = [];
	for (var i = 0; i < argument_count; i++) {
		_portraitsList[i] = argument[i];
	}
	return _portraitsList;
}

function impostGuiTheme(_theme) {
	global.selectedGuiTheme = _theme;
	global.portraitIndex = _theme.enumRef;
}

function createNewGuiTheme (
	_enumRef,
	_basicBG, _buttons, _txtBox, 
	playerPortrait, _inventoryPortrait, 
	_statisticsBook, _decoBg, _systemEnchBg, _selectedColor
	//enchantment system bg, 
	/*
		Ogni volta che si crea una nuova "meccanica" GUI,
		bisognera inserire la sua "blueprint" qui
	*/
) 
{
	var _newGuiSet = {
		enumRef: _enumRef, 
		bg: _basicBG,
		buttons: _buttons,
		textBox: _txtBox,
		inventoryPortrait: _inventoryPortrait,
		miniPortrait: playerPortrait,
		itemStatsBook: _statisticsBook,
		decoBg: _decoBg,
		systemEnchBg: _systemEnchBg,
		selectionColor: _selectedColor
	}

	return _newGuiSet;
}

global.theme_ORANGE = createNewGuiTheme(
	GUI_THEMES.ORANGE,
	sGUI_BackGround_ORANGE,
	sGUI_BattleButton_ORANGE,
	sGUI_TextBox_lights_ORANGE,
	sGUI_PlayerMiniPortrait_ORANGE,
	sGUI_InventoryMiniPortrait_ORANGE,
	sGUI_ItemStatisticsBook_ORANGE,
	sGUI_DecoBg_ORANGE,
	sGUI_EnchantSystemBg_ORANGE,
	c_custom_yellow
);

global.theme_NIGHT_VISION = createNewGuiTheme(
	GUI_THEMES.NIGHT_VISION,
	sGUI_BackGround_NIGHT_VISION,
	sGUI_BattleButton_NIGHT_VISION,
	sGUI_TextBox_NIGHT_VISION,
	sGUI_PlayerMiniPortrait_NIGHT_VISION,
	sGUI_InventoryMiniPortrait_NIGHT_VISION,
	sGUI_ItemStatisticsBook_NIGHT_VISION,
	sGUI_DecoBg_NIGHT_VISION,
	sGUI_EnchantSystemBG_NIGHT_VISION,
	c_custom_night_red
);

impostGuiTheme(global.theme_NIGHT_VISION);