//Sub menu macros
#macro SUB_MENU_ATTACK 0
#macro SUB_MENU_UNBIND 1
#macro SUB_MENU_SPECIAL_OPTION 2

function buildNewSubOption(_name, _textSprite, selectFunc, func, flavourText, specialFlavourText)
{
	return {
		name: _name,
		textSprite: _textSprite,
		_selectFunction: selectFunc,
		_function: func,
		_flavourText: flavourText,
		_failedAttackFlavourText: specialFlavourText //gonna changw this to -> special flavour text (for special occasions)
	}
}
function initializePlayerSubBattleMenuOptions()
{	
	attack_function = buildNewSubOption("(ATK)", sAttackTextSprite, selectedAttackFunction, attackFunction,
				 ["<>The player decided to attack!"], 
				 ["<>The player has tried to ATTACK..."]);

	unbind_function = buildNewSubOption("<REFY>", sUnbindTextSprite, selectedUnbindCage, unbindFunction,
				["<>The player decidec to UNBIND the cage!"], []);
	
	defence_function = buildNewSubOption("[DEF]", sDefendTextSprite, selectedDefenceFunction, defenceFunction,
				["<>Player decided to DEFEND!", "<>Damage DECREASED!"], []);
	
	//The sub battle menu options that are coded in the game
	global.playerOptions = {
		attack_function,
		unbind_function,
		defence_function,
	}

	//The options the player can actually use into the game
	global.playerEquippedOptions[SUB_MENU_ATTACK] = global.playerOptions.attack_function;
	global.playerEquippedOptions[SUB_MENU_UNBIND] = global.playerOptions.unbind_function;
	global.playerEquippedOptions[SUB_MENU_SPECIAL_OPTION] =  global.playerOptions.defence_function;
}