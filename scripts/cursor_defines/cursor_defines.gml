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
	if (instance_exists(oCustomCursor)) {
		oCustomCursor.setUpCursorVars();
	}
}

function setToDefault() {
	global.choosenCursor = DEFAULT_CURSOR;
}

function createClickDrop(_sprite, _angle, _dropSound, _moveCursor = false, _randAngle = false) {
	var _drop = instance_create_layer(oCustomCursor.x + 20, oCustomCursor.y + 35, LAYER_EFFECT_TOP, oCursorDrop);
	_drop.sprite_index = _sprite;
	_drop.dropSound = _dropSound;
	if (_moveCursor) {
		_drop.setUpCursorMovement();
	}
	if (_randAngle) {
		_drop.image_angle = irandom_range(_angle, _angle + 10);
		return;
	}
	_drop.image_angle = -_angle;	
}

function createSplatClick(_x, _y, _sprite, _customFunc = void, _imageSpeed = 0) {
	if (instance_number(oCursorSplatObj) < MAX_SPLAT_OBJ_NUMBER)
	{
		var _splatFX = instance_create_layer(_x, _y, LAYER_EFFECT_TOP, oCursorSplatObj);
		_splatFX.setScaleVars(1, 1, 0, 0, 0, 0);
		_splatFX.setAlphaVars(1, 0, -0.005);
		_splatFX.setUpFadeOutTimer();
		_splatFX.customMethod = _customFunc;
		_splatFX.sprite_index = _sprite;
		_splatFX.image_speed = _imageSpeed
		_splatFX.image_angle = irandom_range(0, 360);
	}
}

function createNewMouseCursor(_baseSprite, _clickedSprite, _clickSound, _clickFunction, _angle = 0, _imageSpeed = 0) {
	var _newCursor = {
		sprite: _baseSprite,
		clickSound: _clickSound,
		clickSprite: _clickedSprite,
		clickFunction: _clickFunction,
		angle : _angle,
		imageSpd: _imageSpeed
	}
	array_push(global.cursorsInGame, _newCursor);
	return _newCursor;
}

global.defaultCursor = createNewMouseCursor(sCursor_basic, sCursor_basic, undefined, void);
global.jazzyBeingCursor = createNewMouseCursor(sJazzyBeingCursor, sJazzyBeingCursorClicked, [sndJazzy_1, sndJazzy_2, sndJazzy_3], void, 0, 1);
global.toolCursor = createNewMouseCursor(sToolCursor, sToolCursor, undefined, void);
global.psiCursor = createNewMouseCursor(sPsiCursor, sPsiCursor, undefined, void);
global.bloodCursor = createNewMouseCursor(sBloodCursor, sBloodCursor, undefined, function setSplat() {
	var _func = function() { oCursorSplatObj.makeSplatGoUp(1); }
	createSplatClick(oCustomCursor.x, oCustomCursor.y, sBloodDrop_1, _func); 
	playSound(sndSplat, SOUND_CHANNEL_1);
	playSoundPitch(sndGoofyScream, SOUND_CHANNEL_2, false, 1, 1, 2); 
});
global.nightPetalCursor = createNewMouseCursor(sNightPetalCursor, sNightPetalCursor, undefined, void);
global.pizzaCursor = createNewMouseCursor(sPizzaCursor, sPizzaCursor, undefined, void);
global.wineGlassCursor = createNewMouseCursor(sWineGlassCursor, sWineGlassCursor, undefined, function() { createClickDrop(sWineDropCursorFX, 140, sndLiquidDrop, true); }, -135);
global.yinYanCursor = createNewMouseCursor(sYinYanCursor, sYinYanCursor, undefined, function() { oCustomCursor.image_index = !oCustomCursor.image_index; }, true);
global.waterMelonCursor = createNewMouseCursor(sWaterMelonCursor, sWaterMelonCursor, undefined, void);
global.paralisyFriend = createNewMouseCursor(sParalisyFriendCursor, sParalisyFriendCursor, undefined, void);
global.containmentCursor = createNewMouseCursor(sContainmentCursor, sContainmentCursor, undefined, void);
global.lemonSliceCursor = createNewMouseCursor(sLemonSliceCursor, sLemonSliceCursor, undefined, void);
global.whatTheFuckCursor = createNewMouseCursor(sWhatTheFuckCursor, sWhatTheFuckCursor, undefined, void);

selectCursor(global.jazzyBeingCursor);












