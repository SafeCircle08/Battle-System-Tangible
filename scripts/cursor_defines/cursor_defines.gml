#macro DEFAULT_CURSOR sCursor_basic
#macro MAX_SPLAT_OBJ_NUMBER 200
#macro MOUSE_NORMAL 0
#macro MOUSE_CLICKED 1
#macro MOUSE_CLICKED_EFFECT 2

randomize();
function void() {}
global.cursorsInGame = [];

function chooseRandomCursor() {
	var _cursorN = array_length(global.cursorsInGame);
	var _index = irandom(_cursorN - 1);
	global.choosenCursor = global.cursorsInGame[_index];
}

function selectCursor(_cursor) {
	global.choosenCursor = _cursor;
}

function setToDefault() {
	global.choosenCursor = DEFAULT_CURSOR;
}

function createSplatClick(_x, _y, _sprite, _imageSpeed = 0) {
	if (instance_number(oCursorSplatObj) < MAX_SPLAT_OBJ_NUMBER)
	{
		var _splatFX = instance_create_layer(_x, _y, LAYER_EFFECT_TOP, oCursorSplatObj);
		_splatFX.sprite_index = _sprite;
		_splatFX.image_speed = _imageSpeed
		_splatFX.image_angle = irandom_range(0, 360);
	}
}

function createNewMouseCursor(_baseSprite, _clickedSprite, _clickSound, _clickFunction) {
	var _newCursor = {
		sprite: _baseSprite,
		clickSound: _clickSound,
		clickSprite: _clickedSprite,
		clickFunction: _clickFunction,
	}
	array_push(global.cursorsInGame, _newCursor);
	return _newCursor;
}

global.defaultCursor = createNewMouseCursor(sCursor_basic, sCursor_basic, undefined, void);
global.jazzyBeingCursor = createNewMouseCursor(sJazzyBeingCursor, sJazzyBeingCursorClicked, [sndJazzy_1, sndJazzy_2, sndJazzy_3], void);
global.toolCursor = createNewMouseCursor(sToolCursor, sToolCursor, undefined, void);
global.psiCursor = createNewMouseCursor(sPsiCursor, sPsiCursor, undefined, void);
global.bloodCursor = createNewMouseCursor(sBloodCursor, sBloodCursor, undefined, function setSplat() {
	createSplatClick(oCustomCursor.x, oCustomCursor.y, sBloodDrop_1); 
	playSound(sndSplat, SOUND_CHANNEL_1);
	playSoundPitch(sndGoofyScream, SOUND_CHANNEL_2, false, 1, 1, 2); 
});
chooseRandomCursor();