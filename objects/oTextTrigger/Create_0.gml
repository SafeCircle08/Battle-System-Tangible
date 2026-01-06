enum PLAYER_FACING_CHECK {
	FACING_UP,
	FACING_DOWN,
	FACING_LEFT,
	FACING_RIGHT,
	FACING_ALL,
	FACING_NOONE
}

enum TEXT_ANIMATIONS_FXS {
	TEXT_AN_SHAKE,
	TEXT_AN_COS,
	TEXT_AN_SIN,
	TEXT_AN_CIRCLE,
	TEXT_AN_W_H_CHANGE,
	TEXT_NO_FXS
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

setPlayerPositionCheck = function(_posToCheck) { playerShouldFace = _posToCheck; }
excludePlayerPosition = function(_posToExclude) { playerExcludePosFace = _posToExclude; }

createTextInst = function() {
	var _textInst = instance_create_layer(x, y, "Text", oTextInstance);
	_textInst.text = textList;
	_textInst.spriteFace = spriteFace;
	_textInst.hasCharacter = hasCharacter;
	_textInst.faceSpriteRef = faceSpriteRef;
	_textInst.characterFaces = characterFaces;
	_textInst.colors = colors;
	_textInst.pagesWithFXs = pagesWithFXs;
}

addCharPage = function(_text, _faceSprRef, _moods, _fxWanted = TEXT_ANIMATIONS_FXS.TEXT_NO_FXS, _color = c_white) {
	hasCharacter = true;
	faceSpriteRef = _faceSprRef;
	array_push(textList, _text);
	array_push(characterFaces, _moods);
	array_push(colors, _color);
	array_push(pagesWithFXs, _fxWanted);
}