if (fadingIn == true) && (fadedIn == false) { fadeIn(); }
if (fadingOut == true) { fadeOut(); exit; }

var _optionList = global.playerEquippedOptions;
var _optionNumber = array_length(_optionList);
var _options = [];
	
//Draws the secondary options (BUTTONS)
for (var i = 0; i < _optionNumber; i++)
{
	//Pushing the right names
	array_push(_options, global.playerEquippedOptions[i].name);
}

battleDelay = setTimer(battleDelay);
if (battleDelay == 0)
{
	if (oBattleManager.showingSubSubWindow == false)
	{
		navigatingBattle(0, _optionNumber - 1);
		if (confirmPressed())
		{
			_optionList[oBattleManager.selected_option]._selectFunction();
		}
	}
}