//Sub menu macros
#macro SUB_MENU_ATTACK 0
#macro SUB_MENU_UNBIND 1
#macro SUB_MENU_SPECIAL_OPTION 2

function buildNewSubOption(_textSprite, selectFunc, func, actionsFlavourText, specialFlavourText = []) {
	return {
		textSprite: _textSprite,
		_selectFunction: selectFunc,
		_function: func,
		_flavourText: actionsFlavourText,
		_failedAttackFlavourText: specialFlavourText //gonna changw this to -> special flavour text (for special occasions)
	}
}
function __initializePlayerSubBattleMenuOptions() {	
	attack_function = buildNewSubOption(sAttackTextSprite, selectedAttackFunction, attackFunction,
				 ["*The player decided\n to attack!"], 
				 ["*The player has tried\n to ATTACK..."]);

	unbind_function = buildNewSubOption(sUnbindTextSprite, selectedUnbindCage, unbindFunction,
				["*The player decided to\n UNBIND the cage!"]);
	
	defence_function = buildNewSubOption(sDefendTextSprite, selectedDefenceFunction, defenceFunction,
				["*Player decided to DEFEND!", "*Damage DECREASED!"]);
	
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