//When you choose an action in the submenu
function selectAction(main = true, _moreStepsAct = true, _sound = undefined, _flavourText = [], _method = function() {}) {
	dontGetTextInputs();
	if (_sound != undefined) { playSound(_sound, SOUND_CHANNEL_2); }
	if (main) {
		_method();
		moreStepsAct = _moreStepsAct;
		if (moreStepsAct) { showingSubWindow = true; }
		var _pages = array_length(_flavourText);
		ds_messages = ds_list_create();
		
		actionsFlavourText = _flavourText;
		
		if ((_pages >= 0) && (_moreStepsAct == false)) {
			for (var i = 0; i < _pages; i++) { ds_messages[| i] = _flavourText[i]; }
		}
	}
	else {
		_method();
		actionChoosen = true; 
		playingGuiAnimation = false;
		showingSubWindow = false;
		battleDelay = 3;
		moreStepsAct = false;
		oSubMenuManager.setToFadeOut();
	}
}

//Reset the text variables to show all the texts
function resetTextVars() { setToFirstPage(); }

//Self explanatory lol
function showMirrors() { instance_activate_object(oMirror); }
function hideMirrors() { instance_deactivate_object(oMirror); }

function easeInBg(_maxAlpha = 0.7, _bgObj = oAttackBG) 
{
	increaseAlpha(
		_bgObj, 
		0.07, 
		_maxAlpha,
		method(_bgObj, function() {
			fadingIn = false;	
		})
	);
}
function easeOutBg(_finalAlpha = 0, _bgObj = oAttackBG)
{
	reduceAlpha(
		_bgObj,
		0.07,
		false,
		method(_bgObj, function(){
			fadingOut = false;
		})
	);
}

//When you are in the sub menu and you press "X"
function resetNavigation(_lastOption = 0, _sound = undefined, _resetMethod = function() {}) {
	getTextInputs();
	actualDrawAlpha = 0;
	selected_option = _lastOption;
	lastPressed = _lastOption;
	decidingSubAction = false;
	moreStepsAct = false;
	actualDrawAlpha = 0;
	battleDelay = 3;
	
	if (_sound != undefined) { playSound(_sound, SOUND_CHANNEL_3); }
	
	oAttackBG.fadingOut = true;
	setSelectionDelay();
	
	_resetMethod();
	
	hideCursor();
	closeBattleBook();
	easeOutBg();
	hideMirrors();
}

function goToPreviousOption(_goToPrevious = function() {}) {
	closeBattleBook();
	_goToPrevious();
}

function terminateAction(_ds_list = [], _method = function() {}) {
	with (oBattleManager) {
		oAttackBG.fadingOut = true;
		showActionsFlavourText = true;
		enemyTextShowed = false;
		decidingSubAction = false;
		showingSubWindow = false;
		actionChoosen = false;
		setSelectionDelay();
		battleDelay = 3;
		
		//Adds the next text line to the actionsFlavourText
		for (var i = 0; i < array_length(_ds_list); i++) {
			array_push(actionsFlavourText, _ds_list[i]);	
		}
		
		closeBattleBook();
		_method();
		
		getTextInputs();
		hideCursor();
		hideMirrors();
		resetTextVars();
		setToOriginalBattleFlavourText(); //original battle text
	}
}