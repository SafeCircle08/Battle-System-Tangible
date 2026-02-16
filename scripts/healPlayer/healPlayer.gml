function healPlayer(_amount, _sound, _channel = SOUND_CHANNEL_1, _flTxtType = FLOATING_TEXT_TYPES.HEALTH) {
	global.playerHP += _amount;
	global.playerHP = clamp(global.playerHP, 0, global.playerMAX_HP);
	var soundGain = 2;
	playSoundNotPlaying(_sound, _channel, false, soundGain);
	
	var _x = room_width / 2;
	var _y = room_height / 2;
	
	if (!instance_exists(oBattleManager)) { 
		createFloatingText(_x, _y, _amount, _flTxtType);
		return;	
	}
	
	if (oBattleManager.isInBulletHellSection()) { 
		_x = oSoul.x;
		_y = oSoul.y;
	} else {
		_x = mouse_x;
		_y = mouse_y;		
	}

	createFloatingText(_x, _y, _amount, _flTxtType);
}