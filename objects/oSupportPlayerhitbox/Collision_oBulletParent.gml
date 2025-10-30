if (oBattleBox.visible == false) { exit; }

randomize();

if (canCollide == true) {	
	
	canCollide = false;
	oBattleManager.screenShake = true;
	
	if (global.playerShield > 1) { shield_shards(); }
	var _randomAtkValue = irandom_range(10, 20);
	var _defaultATKValue = global.bulletATK + _randomAtkValue;
	var _shieldSaved = irandom_range(1, 5);
	var _shieldDmg = 30 - _shieldSaved;
	var _playerDmg = 0;
	
	//SE E' DIFESO SUBIRA MENO DANNI
	if (oBattleManager.defended == true) {
		global.defenceValue = irandom_range(10, 15); //Defence value casuale
	}

	if (godMode == 0)  {	
		if (global.playerShield > 0) { 
			global.playerShield -= _shieldDmg;
			createFloatingText(x, y, _shieldDmg, FLOATING_TEXT_TYPES.SHIELD);
		}
		else { 
			_playerDmg = _defaultATKValue - global.defenceValue;
			hitPlayer(_playerDmg);
		};	
	}
	godMode = 50;
}