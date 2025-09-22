sprite_index = global.choosenCursor.sprite;
image_speed = global.choosenCursor.imageSpd;
if (global.choosenCursor.enableRotation) { image_angle = global.choosenCursor.angle;}

cursorOn = false;

startCursorX = mouse_x;
startCursorY = mouse_y;
framesSpentMoving = 0;

setNewCursorStartCoords = function() {
	startCursorX = mouse_x;
	startCursorY = mouse_y;			
}

resetSpentMovingTimer = function() { 
	if (framesSpentMoving != 0) { framesSpentMoving = 0; }		
}

setUpCursorVars = function(_angle = global.choosenCursor.angle, _spd = global.choosenCursor.imageSpd, _setIndex = true)
{
	with (oCustomCursor) {
		if (global.choosenCursor.enableRotation) { image_angle = global.choosenCursor.angle; }
		else { image_angle = 0; }
		sprite_index = global.choosenCursor.sprite;
		image_speed = _spd;
		if (_setIndex) { image_index = 0; }
	}
}

cursorCursing = function()
{
	with (oCustomCursor) {
		x = mouse_x;
		y = mouse_y;
		x = clamp(x, 0, room_width - 5);
		y = clamp(y, 0, room_height);
	}
	var _cursor = global.choosenCursor;
	
	if (cursorIsMoving(_cursor, true, 5)) {
		_cursor.stepFunction();	
	}
	
	if (mouse_check_button_pressed(mb_left)) { cursorOnClick(_cursor); }
	if (mouse_check_button_released(mb_right)) { playSound(_cursor.leftClickSound, SOUND_CHANNEL_4); }
	if (mouse_check_button_released(mb_left)) { resetCursor(_cursor); }
}

cursorOnClick = function(_cursor)
{
	if (_cursor.clickSound != undefined) {
		if (_cursor.enableSounds) { playCursorClickSounds(_cursor, _cursor.playSoundType); }
	}
		if (_cursor.enableFX) {
		sprite_index = _cursor.clickSprite;
		_cursor.onClickFunction();
	}
}

resetCursor = function(_cursor) {
	sprite_index = _cursor.sprite;
}

playCursorClickSounds = function(_cursor, _playWhenSilence = CURSOR_PLAY_SOUND_WHEN_SILENCE)
{
	if (is_array(_cursor.clickSound))
	{
		var _sndList = _cursor.clickSound;
		var _soundsN = array_length(_sndList);
		var _index = irandom_range(0, _soundsN - 1);
		var _clickSound = _sndList[_index];
		var _anySoundIsPlaying = false;
		
		for (var i = 0; i < _soundsN; i++) {
			if (audio_is_playing(_cursor.clickSound[i])) {
				_anySoundIsPlaying = true;
				break;
			}
		}	
		if (_playWhenSilence) {
			if (!audio_is_playing(_clickSound) && _anySoundIsPlaying == false) { 
				playSound(_clickSound, SOUND_CHANNEL_1);
			}
		} else { playSound(_clickSound, SOUND_CHANNEL_1); }
	}
	else
	{ 
		if (_playWhenSilence) {
			if (!audio_is_playing(_cursor.clickSound)) { 
				playSound(_cursor.clickSound, SOUND_CHANNEL_1);
			} 
		} else { playSound(_cursor.clickSound, SOUND_CHANNEL_1); }
	}
}

setChooseCursor = function(_selectedCursorSpr)
{
	if (instance_exists(oCustomCursor)) { instance_destroy(oCustomCursor); }    
	global.choosenCursor = _selectedCursorSpr;
	var _newCursor = instance_create_layer(mouse_x, mouse_y, LAYER_CURSOR, oCustomCursor);	
}