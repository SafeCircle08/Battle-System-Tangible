layers = ["LoopBg_1", "LoopBg_2"];

autoSkipTimerRef = 150;
autoSkipTimer = autoSkipTimerRef;

textFinishedTimer = TEXT_FINISHED_TIMER;

flavourTextIndex = 0;
actionsFlavourText = []; //text about a specific action

showingExtraMonologueText = false;
battleFlavourText = global.battleFlavourTexts[flavourTextIndex]; //texts specific to the battle 

global.borderWidth = 100;
global.borderHeight = 100;

//PLAYER VARIABLES
battle = true;
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
charCount = 0;
page = 0;
speechSpeed = 0.5;
messageCounter = 0;
showActionsFlavourText = false;
messageTimer = 0;
timeBeforePressed = 15;
enemyTextShowed = false;
enemyCanShowText = 0;
dialogueDelay = 10;
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

setSelectionDelay = function() { takenOptionDelay = 3; }

//Methods
setSubMenuPositions = function(_x, _y){
	subMenuX = _x;
	subMenuY = _y;
}
showingSubSubWindow = false;

actionChoosen = false;
showingSubWindow = false;

increaseMainMenuXPos = function(){
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
	messageCounter = 0;
}

changeTurn = function() {
	resetTextVars();
	showActionsFlavourText = false;
	playerTurn = !playerTurn; 
	buttonFrame = 0;
	messageCounter = 0;
	
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

isInBulletHellSection = function() { return (oBattleBox.visible); }

increaseTurn = function() {
	turnNumber += 1;		
}

setToStartTurn = function() {
	flavourTextIndex = 0;
	selected_option = 0;
	showActionsFlavourText = true;
	actualDrawAlpha = 0;
	oBattleBox.visible = false;
	global.enemyTimer = 0;
	global.getTextBoxInputs = true;
	
	actionsFlavourText = ["*Turn Finished."];
	
	var _flavourTextProbs = irandom_range(0, 7);
	if (_flavourTextProbs == 6) { menageAfterTurnFlavourTexts(); }
	flavourTextIndex = getRandomIndex(global.battleFlavourTexts);
	battleFlavourText = global.battleFlavourTexts[flavourTextIndex];
}
	
changeTurnAfterEnemySpeech = function() {
	enemyTextShowed = true;
	changeTurn();
	autoSkipTimer = autoSkipTimerRef;
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

drawActionFlavourText = function() {
	drawTextBoxText(
		actionsFlavourText, 
		Mono, 
		false, 
		true,
		true, 
		true, 
	);	
}
drawBattleFlavourText = function() {
	drawTextBoxText(
		battleFlavourText, 
		Mono, 
		false,
		false,
		true, 
		true
	);	
}
drawEnemyText = function() {
	var _page = global.textList[turnNumber];
	drawTextBoxText(
		_page.text,
		fHungrySkinny,
		false,
		false,
		true,
		true,
		sndSteamPunkTalk,
		true,
		183, 35
	);		
}

//The effect
//makeAlphaSinEffect(15, 0, LAYER_UNDER_EFFECT, 5, global.selectedGuiTheme.bg, 3, false, 2, 1.8, true);
//Initialize the "coded" functions
initializeAllCreatedFunctions();

//Initialize the functions the player havs
initializePlayerSubBattleMenuOptions();
initializePlayerMainBattleMenuOptions();