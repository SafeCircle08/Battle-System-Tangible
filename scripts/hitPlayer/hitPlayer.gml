function hitPlayer(_dmg, _snd = sndHurt) {
	global.playerHP -= _dmg;
	playSound(_snd, SOUND_CHANNEL_1);
	createHitSlashes(2);
	
	var _x = room_width / 2;
	var _y = room_height / 2;
	
	if (!instance_exists(oBattleManager)) { 
		createFloatingText(_x, _y, _dmg, FLOATING_TEXT_TYPES.DAMAGE);
		return;
	}
	
	oSoul.damageTaken += _dmg;	
	if (oBattleManager.isInBulletHellSection()) {
		_x = oSoul.x;
		_y = oSoul.y;
	} else {
		_x = mouse_x;
		_y = mouse_y;
	}
	
	createFloatingText(_x, _y, _dmg, FLOATING_TEXT_TYPES.DAMAGE);
	return;
}