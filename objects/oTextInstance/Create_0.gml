text = [];
font = Mono;
hasCharacter = false;
isActionsFlavourText = false;
inBox = true;
inBattle = false;
sound = sndBasicTxt1;
enemySpeech = false;
txtX = undefined;
txtY = undefined;

page = 0;
dialogueDelay = 5;
speechSpeed = 0.5;
xPos = 0;
yPos = 0;
charCount = 0;
charCountBuffer = 0;
spriteFace = 0;
sound = sndBasicTxt1;

existanceTextTime = 0;

character = 0;
textFinishedTimer = 30;
textHasFinished = false;
faceSpriteRef = undefined;

characterFaces = [];
colors = [];
pagesWithFXs = [];

autoSkipTimerRef = 150;
autoSkipTimer = autoSkipTimerRef;

drawBattleBox = function() {
	var guiX = room_width / 2;
	var guiY = room_height;
	draw_sprite(setToGuiTxtBoxSelectedTheme(), 0, guiX, guiY - 3);			
}
