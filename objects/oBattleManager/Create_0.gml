//The manager of the battle battling
mainOptionsNames = [];

layers = ["LoopBg_1", "LoopBg_2"];

textFinishedTimer = TEXT_FINISHED_TIMER;

flavourTextIndex = 0;
flavourText = [];

global.borderWidth = 100;
global.borderHeight = 100;

//PLAYER VARIABLES
battle = true;
turnNumber = 13 ;
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
ds_messages = ds_list_create();
messageCounter = 0;
showFlavourText = false;
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

//Method
setSubMenuPositions = function(_x, _y)
{
	subMenuX = _x;
	subMenuY = _y;
}
showingSubSubWindow = false;

actionChoosen = false;
showingSubWindow = false;
subSubDelay = 3;

increaseMainMenuXPos = function()
{
	var _goalButtonX = 2;
	if (startButtonX < _goalButtonX)
	{
		buttonFrame += 0.05;
		startButtonX += 20 * buttonFrame;
	}
	startButtonX = clamp(startButtonX, -200, _goalButtonX);		
}

decreaseMainMenuXPos = function()
{
	if (startButtonX > startButtonXRef)
	{
		startButtonX -= 5;
		startButtonX = clamp(startButtonX, -200, 100);
	}		
}	

isEnemySpeaking = function()
{
	return (enemyCanShowText) &&
		   (enemyTextShowed == false)	
}

playerMainActionTurn = function()
{
	return (playerTurn == true) &&
		   (showFlavourText == false) && 
		   (decidingSubAction == false)	
}

isNotPlayerTurn = function()
{
	return (playerTurn == false) &&
		   (showFlavourText == false)
}

goToBulletHellSection = function()
{
	resetTextVars();
	enemyTextShowed = true;
	showFlavourText = false;
	playerTurn = false; 
	messageCounter = 0;
}

changeTurn = function()
{
	resetTextVars();
	showFlavourText = false;
	playerTurn = !playerTurn; 
	buttonFrame = 0;
	messageCounter = 0;
	if (playerTurn == false) {
		oBulletGeneratorManager.createGenerator();
		oBattleBox.visible = true;
		enemyCanShowText = false;
	}
}

isInBulletHellSection = function() { return (oBattleBox.visible); }

increaseTurn = function() {
	turnNumber += 1;		
}

showingExtraMonologueText = false;
writtenBattleText = global.battleFlavourTexts[flavourTextIndex];

setToStartTurn = function() {
	selected_option = 0;
	enemyTextShowed = true;
	showFlavourText = true;
	actualDrawAlpha = 0;
	oBattleBox.visible = false;
	global.enemyTimer = 0;
	global.getTextBoxInputs = true;
	
	flavourText = ["*Turn Finished."];
	flavourTextIndex = 0;
	var _flavourTextProbs = irandom_range(0, 7);
	if (_flavourTextProbs == 6) {
		menageAfterTurnFlavourTexts(); 
		flavourTextIndex = getRandomIndex(global.battleFlavourTexts);
	}
	writtenBattleText = global.battleFlavourTexts[flavourTextIndex];
}

//The effect
//makeAlphaSinEffect(15, 0, LAYER_UNDER_EFFECT, 5, global.selectedGuiStyle.bg, 3, false, 2, 1.8, true);
//Initialize the "coded" functions
initializeAllCreatedFunctions();

//Initialize the functions the player havs
initializePlayerSubBattleMenuOptions();
initializePlayerMainBattleMenuOptions();