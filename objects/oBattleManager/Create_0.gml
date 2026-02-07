layers = ["LoopBg_1", "LoopBg_2"];

flavourTextIndex = 0;
actionsFlavourText = []; //text about a specific action
showingExtraMonologueText = false;
battleFlavourText = global.battleFlavourTexts[flavourTextIndex]; //texts specific to the battle 

global.borderWidth = 100;
global.borderHeight = 100;

//PLAYER VARIABLES
turnNumber = 0;
defended = false;
playerDeath = false;
playerTurn = true;

//GENERAL ACT VARIABLES
moreStepsAct = false; //if an action requires more steps
decidingSubAction = false;
selected_option = 0;

shieldBarW = 121;
hpbarW = 121;

//BOX VARIABLES and TEXTS
showActionsFlavourText = false;
enemyTextShowed = false;
enemyCanShowText = 0;
playerHpTextColor = c_white;

//BUTTONS VARIABLES
startButtonXRef = -200;
startButtonX = startButtonXRef;
buttonFrame = 0;
btTextWrote = false;

//INVENTORY VARIABLES
takenOptionDelay = 3;
itemOutputMessage = undefined;

//BATTLE OPTIONS VARIABLES
battleDelay = 3;
actualDrawAlpha = 0;

initializeInventoryAnimations();
initializeSubBattleMenuAnimations();

subMenuX = 0;
subMenuY = 0;
mainPressed = 0;
lastPressed = 0;

playingGuiAnimation = false;
showingSubSubWindow = false;
actionChoosen = false;
showingSubWindow = false;

#region HELPFUL METHODS

setSelectionDelay = function() { 
	takenOptionDelay = 3; 
}
	
setSubMenuPositions = function(_x, _y){
	subMenuX = _x;
	subMenuY = _y;
}

increaseMainMenuXPos = function(){
	
	if (isInBulletHellSection()) return;
	
	var _goalButtonX = 2;
	if (startButtonX < _goalButtonX)
	{
		buttonFrame += 0.05;
		startButtonX += 20 * buttonFrame;
	}
	startButtonX = clamp(startButtonX, -200, _goalButtonX);		
}

decreaseMainMenuXPos = function(){
	if (startButtonX > startButtonXRef){
		startButtonX -= 5;
		startButtonX = clamp(startButtonX, -200, 100);
	}		
}	

isEnemySpeaking = function(){
	return (enemyCanShowText) &&
		   (enemyTextShowed == false)	
}

playerMainActionTurn = function(){
	return (playerTurn == true) &&
		   (showActionsFlavourText == false) && 
		   (decidingSubAction == false)	
}

isNotPlayerTurn = function(){
	return (playerTurn == false) &&
		   (showActionsFlavourText == false)
}

playerIsDefended = function() {
	return defended;	
}

goToBulletHellSection = function() {
	resetTextVars();
	enemyTextShowed = true;
	showActionsFlavourText = false;
	playerTurn = false; 
}

changeTurn = function() {
	resetTextVars();
	showActionsFlavourText = false;
	playerTurn = !playerTurn; 
	buttonFrame = 0;
	
	//GUI->battleBox
	if (playerTurn == false) {
		oBulletGeneratorManager.createGenerator();
		oBattleBox.visible = true;
		enemyCanShowText = false;
	} else {
		//battleBox->GUI
		enemyTextShowed = false;
	}
}

isInBulletHellSection = function() { 
	return (oBattleBox.visible); 
}

increaseTurn = function() {
	turnNumber += 1;		
}

setToStartTurn = function() {
	flavourTextIndex = 0;
	selected_option = 0;
	showActionsFlavourText = true;
	actualDrawAlpha = 0;
	oBattleBox.setToStartTurn();
	global.enemyTimer = 0;
	global.getTextBoxInputs = true;
	
	actionsFlavourText = ["*Turn Finished."]; //special actions text meaning the turn is over
	
	var _flavourTextProbs = irandom_range(0, 7);
	if (_flavourTextProbs == 6) { menageAfterTurnFlavourTexts(); }
	flavourTextIndex = getRandomIndex(global.battleFlavourTexts);
	battleFlavourText = global.battleFlavourTexts[flavourTextIndex];
}
	
changeTurnAfterEnemySpeech = function() {
	enemyTextShowed = true;
	changeTurn();
}

increaseEnemyTurnTimer = function() {
	global.enemyTimer++;	
}

enemyTimerEnded = function() {
	return (global.enemyTimer >= global.enemyAttackTime);	
}

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
	draw_sprite(_bookSpr, _bookSubImg, _bookX + inventoryXAdder, _bookY - 2);		
}

drawItemDesc = function(_infoX, _infoY, _infoBorder, _border) {
	var scale = 0.5;
	var sep = 0.5;
	var w = 50;
	draw_set_color(c_white);
	var _info = itemInfo(selected_option);
	draw_text_ext_transformed(_infoX + _infoBorder * 2 + inventoryXAdder,  _infoY + _border / 2, _info, 20, 200, scale, scale, 0);		
}

drawInventoryCapacity = function(_inventoryX, _inventoryY, _border) {
	draw_set_font(fHungryBig);
	var _invCapacity = string(array_length(global.equippedItems)) + "/" + string(MAX_ITEMS_NUM);
	draw_set_color(c_black);
	draw_text(_inventoryX + _border * 3 + inventoryXAdder + 1, _inventoryY - _border + 1, _invCapacity);
	draw_set_color(c_white);
	draw_text(_inventoryX + _border * 3 + inventoryXAdder, _inventoryY - _border, _invCapacity);
}

#endregion

createBattleManagerObjects();

//Initialize the "coded" functions
initializeAllCreatedFunctions();

//Initialize the functions the player havs
initializePlayerSubBattleMenuOptions();
initializePlayerMainBattleMenuOptions();