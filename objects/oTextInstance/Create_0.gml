cam = view_camera[view_current];
camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam);
sprTextBox = setToGuiTxtBoxSelectedTheme();
boxW = sprite_get_width(sprTextBox); 
boxH = sprite_get_height(sprTextBox);
camX = camera_get_view_x(cam);
camY = camera_get_view_y(cam);	
txtBoxX = camX + (camW / 2);
txtBoxY = camY + camH - 3;	

updateCamCoords = function() {
	camX = camera_get_view_x(cam);
	camY = camera_get_view_y(cam);	
}

updateBoxCoords = function() {
	txtBoxX = camX + (camW / 2);
	txtBoxY = camY + camH - 3;	
}

updateCoords = function() {
	updateCamCoords();
	updateBoxCoords();
}

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

specialDelay = 0;

enemyAfterTurnText = false;

commaDelay = 7;
pointDelay = 10;

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
textFinishedTimer = 10;
textHasFinished = false;
faceSpriteRef = undefined;

pagesList = [];

characterFaces = [];
colors = [];
pagesWithFXs = [];
pagesFuncs = [];

autoSkipTimerRef = 150;
autoSkipTimer = autoSkipTimerRef;

handlingText = true;
enableHandlingText = function() { handlingText = true; }
disableHandlingText = function() { handlingText = false; }
isHandlingText = function() { return handlingText; }

manageMinigamePage = function(_page) {
	var _minigame = _page.minigameType;
	switch (_minigame) {
		case MINIGAMES.HAND_SHAKE: startHandShakeTextMinigame(self); break;
		case MINIGAMES.NOONE: break;
	}
}

drawBattleBox = function() {
	var guiX = room_width / 2;
	var guiY = room_height;
	draw_sprite(setToGuiTxtBoxSelectedTheme(), 0, guiX, guiY - 3);			
}
