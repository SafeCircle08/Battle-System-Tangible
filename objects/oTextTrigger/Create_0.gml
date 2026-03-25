enum PLAYER_FACING_CHECK {
	FACING_RIGHT,
	FACING_UP,
	FACING_LEFT,
	FACING_DOWN,
	FACING_ALL,
	FACING_NOONE
}

enum TXT_ANIM {
	WAVEY,
	SHAKY,
	NOONE
}



playerShouldFace = PLAYER_FACING_CHECK.FACING_ALL; //(and the different sprites)
playerExcludePosFace = PLAYER_FACING_CHECK.FACING_NOONE;
canInteract = true;
textList = [];
npcReference = 0;
textFinishedTimer = 30;

textList = [];
spriteFace = 0;
hasCharacter = false;
faceSpriteRef = undefined;
characterFaces = [];
colors = [];
pagesWithFXs = [];
pagesFuncs = [];

setPlayerPositionCheck = function(_posToCheck) { playerShouldFace = _posToCheck; }
excludePlayerPosition = function(_posToExclude) { playerExcludePosFace = _posToExclude; }

pagesList = [];
myTextInstance = noone;

createTextInst = function() {
	myTextInstance = instance_create_layer(x, y, "Text", oTextInstance);
	myTextInstance.pagesList = pagesList;
}


addCharPage = function(_text, _faceSprRef, _moods, _fxWanted = TXT_ANIM.NOONE, _func = function() {  }, _color = setToGuiTextColorSelectedTheme()) {
	hasCharacter = true;
	faceSpriteRef = _faceSprRef;
	array_push(textList, _text);
	array_push(characterFaces, _moods);
	array_push(colors, _color);
	array_push(pagesWithFXs, _fxWanted);
}