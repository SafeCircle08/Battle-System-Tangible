#macro STYLE_GUI_DEFAULT 0
#macro STYLE_GUI_GOTHIC 1
#macro STYLE_BASE 2

global.styleSelection = 1;

global.guiStyles = [];
global.customStylesSets = [];
global.selectedGuiStyle = undefined;
global.selectedCustomGuiStyle = undefined;

function createNewGuiStyleSet
(
	_basicBG, _buttons, _txtBox, 
	playerPortrait, _inventoryPortrait, 
	_statisticsBook, _decoBg, _systemEnchBg, _selectedColor, custom = false
	//enchantment system bg, 
	/*
		Ogni volta che si crea una nuova "meccanica" GUI,
		bisognera inserire la sua "blueprint" qui
	*/
) 
{
	var _newGuiSet = {
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
	if (custom == true) {
		array_push(global.customStylesSets, _newGuiSet);
		return;
	}
	array_push(global.guiStyles, _newGuiSet);
	return _newGuiSet;
}

//DEFAULT GUI STYLE
createNewGuiStyleSet(
	sGuiBg_DEFAULT,
	sGUIBattleButton_DEFAULT,
	sTextBox_DEFAULT,
	sPlayerMiniPortrait_DEFAULT,
	sInventoryMiniPortrait_DEFAULT,
	sItemStatisticsBook_DEFAULT,
	sDecoBG_DEFAULT,
	sEnchantSystemBG_DEFAULT,
	make_color_rgb(255, 21, 97)
	//all things that will get added in the future
);

/*
//---------HELLISH PALETTE STYLE---------
createNewGuiStyleSet(
	sGuiBg_HELLISH,
	sGUIBattleButton_HELLISH,
	sNewBox,
	sPlayerMiniPortrait,
	sInventoryMiniPortrait,
	sItemStatisticsBook
	//all things that will get added in the future
);
*/

//---------TO NAME (orange and purple) GUI STYLE---------
createNewGuiStyleSet(
	sInventory,
	sGUIBattleButton,
	sTextBox_GOTHIC,
	sPlayerMiniPortrait,
	sInventoryMiniPortrait,
	sItemStatisticsBook,
	sDecoBg_ORANGE,
	sEnchantSystemBG,
	make_color_rgb(255, 245, 104)
);

/*
//---------GOTHIC/DARK GUI STYLE---------
createNewGuiStyleSet(
	sGuiBg_GOTHIC,
	sGuiBattleButton_GOTHIC,
	sTextBox_GOTHIC,
	sPlayerMiniPortrait_GOTHIC,
	sInventoryMiniPortrait_GOTHIC,
	sItemStatisticsBook_GOTHIC
);
*/

global.selectedGuiStyle = global.guiStyles[global.styleSelection];





















