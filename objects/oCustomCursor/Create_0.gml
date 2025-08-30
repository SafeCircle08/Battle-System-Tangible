sprite_index = global.choosenCursor.sprite;
image_speed = 1;

cursorOn = false;

cursorCursing = function()
{
	with (oCustomCursor) {
		x = mouse_x;
		y = mouse_y;
		x = clamp(x, 0, room_width - 5);
		y = clamp(y, 0, room_height);
	}
	
	var _cursor = global.choosenCursor;
	if (mouse_check_button_pressed(mb_left)) {
		cursorOnClick(_cursor);
	}
	if (mouse_check_button_released(mb_left)) {
		resetCursor(_cursor);
	}
}

cursorOnClick = function(_cursor)
{
	if (_cursor.clickSound != undefined) {
		playCursorClickSounds(_cursor);	
	}
	sprite_index = _cursor.clickSprite;
	_cursor.clickFunction();
}

resetCursor = function(_cursor) {
	sprite_index = _cursor.sprite;
}

playCursorClickSounds = function(_cursor)
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
		if (!audio_is_playing(_clickSound) && _anySoundIsPlaying == false) { 
			playSound(_clickSound, SOUND_CHANNEL_1); 
		}
	}
	else
	{ 
		if (!audio_is_playing(_cursor.clickSound)) { playSound(_cursor.clickSound, SOUND_CHANNEL_1); } 
	}
}

setChooseCursor = function(_selectedCursorSpr)
{
	if (instance_exists(oCustomCursor)) { instance_destroy(oCustomCursor); }    
	global.choosenCursor = _selectedCursorSpr;
	var _newCursor = instance_create_layer(mouse_x, mouse_y, "Instances", oCustomCursor);	
}