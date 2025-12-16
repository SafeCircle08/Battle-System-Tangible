if (fadingIn == true) && (fadedIn == false) { fadeIn(); }
if (fadingOut == true) { fadeOut(); exit; }

var _optionList = global.playerEquippedOptions;
var _optionNumber = array_length(_optionList);

battleDelay = setTimer(battleDelay);
if (battleDelay == 0) {
	navigatingBattle(0, _optionNumber - 1);
	if (confirmPressed()) {
		_optionList[oBattleManager.selected_option]._selectFunction();
	}
}