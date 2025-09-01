#macro DEFAULT_CURSOR sCursor_basic
#macro MAX_SPLAT_OBJ_NUMBER 200

#macro CURSOR_PLAY_SOUND_WHEN_SILENCE true
#macro CURSORS_PLAY_SOUND_ALWAYS false

randomize();
function void() {}
global.cursorsInGame = []; 
global.obtainedCursors = []; //the cursors the player has

function collectNewCursor(_newCursor) {}

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
	if (global.choosenCursor.enableRotation == false) { return; } 
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

function createNewMouseCursor(
	_baseSprite, _clickedSprite, _clickSound, 
	_clickFunction = void, _angle = 0, _imageSpeed = 0,
	_playSoundType = CURSOR_PLAY_SOUND_WHEN_SILENCE, _leftSoundClick = sndBasicLeftMouseClick,
	_description = ""
) {
	var _newCursor = {
		sprite: _baseSprite,
		clickSound: _clickSound,
		clickSprite: _clickedSprite,
		onClickFunction: _clickFunction,
		angle : _angle,
		imageSpd: _imageSpeed,
		playSoundType: _playSoundType,
		leftClickSound: _leftSoundClick,
		description: _description,
		
		//Settings
		
		enableFX: true,
		enableSounds: true,
		enableRotation: true
	}
	array_push(global.cursorsInGame, _newCursor);
	return _newCursor;
}

global.defaultCursor = createNewMouseCursor(sCursor_basic, sCursor_basic, sndBasicSoundClick);
global.jazzyBeingCursor = createNewMouseCursor(sJazzyBeingCursor, sJazzyBeingCursorClicked, [sndJazzy_1, sndJazzy_2, sndJazzy_3], void, 0, 1);
global.toolCursor = createNewMouseCursor(sToolCursor, sToolCursor, sndBasicSoundClick);
global.psiCursor = createNewMouseCursor(sPsiCursor, sPsiCursor, sndBasicSoundClick);

global.bloodCursor = createNewMouseCursor(sBloodCursor, sBloodCursor, undefined, function() {
					 var _func = function() { oCursorSplatObj.makeSplatGoUp(1); }
					 createSplatClick(oCustomCursor.x, oCustomCursor.y, sBloodDrop_1, _func); 
					 playSound(sndSplat, SOUND_CHANNEL_1);
					 playSoundPitch(sndGoofyScream, SOUND_CHANNEL_2, false, 1, 1, 2); });

global.nightPetalCursor = createNewMouseCursor(sNightPetalCursor, sNightPetalCursor, sndBasicSoundClick);
global.pizzaCursor = createNewMouseCursor(sPizzaCursor, sPizzaCursor, sndBasicSoundClick);
global.wineGlassCursor = createNewMouseCursor(sWineGlassCursor, sWineGlassCursor, undefined, function() { createClickDrop(sWineDropCursorFX, 140, sndLiquidDrop, true); }, -135, );
global.yinYanCursor = createNewMouseCursor(sYinYanCursor, sYinYanCursor, undefined, function() { changeCursorImg(); clickFunction(sYinYanFX); }, true);
global.waterMelonCursor = createNewMouseCursor(sWaterMelonCursor, sWaterMelonCursor, sndBasicSoundClick);

global.paralisyFriend = createNewMouseCursor(sParalisyFriendCursor, sParalisyFriendCursorClicked, 
					    [sndParalisy_1, sndParalisy_2, sndParalisy_3, sndParalisy_4], 
						function () { clickFunction(sParalisyFriendCursorFX); },
						0, 1, CURSOR_PLAY_SOUND_WHEN_SILENCE);

global.containmentCursor = createNewMouseCursor(sContainmentCursor, sContainmentCursor, sndBasicSoundClick);
global.lemonSliceCursor = createNewMouseCursor(sLemonSliceCursor, sLemonSliceCursor, sndBasicSoundClick);
global.whatTheFuckCursor = createNewMouseCursor(sWhatTheFuckCursor, sWhatTheFuckCursor, sndBasicSoundClick);
global.signDirtCursor = createNewMouseCursor(sSignDirtCursor, sSignDirtCursor, [sndMetalHit_1, sndMetalHit_2, sndMetalHit_3, sndMetalHit_4, sndMetalHit_5],
						function () { clickFunction(sDirtFX, false); },
						0, 0, CURSORS_PLAY_SOUND_ALWAYS);
						
global.wasdCursor = createNewMouseCursor(sWasdCursor, sWasdCursor, undefined, function() { clickFunction(noone); changeCursorImg(false); }, 45, 0);

selectCursor(global.wineGlassCursor);