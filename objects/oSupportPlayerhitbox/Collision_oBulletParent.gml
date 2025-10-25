if (oBattleBox.visible == false) { exit; }

randomize();

if (canCollide == true)
{	
	global.attackRandom = global.bulletATK + irandom_range(10, 20);
	canCollide = false;
	oBattleManager.screenShake = true;
	
	if (global.playerShield < 1) { audio_play_sound(sndHurt, 50, false, global.soundGain); }
	
	if (global.playerShield > 1) { shield_shards(); }
	
	//SE E' DIFESO SUBIRA MENO DANNI
	if (playerIsDefended()) {
		global.defenceValue = irandom_range(10, 15); //random def value
		var _dmg = global.attackRandom - global.defenceValue;
		createFloatingText(x, y, _dmg, FLOATING_TEXT_TYPES.SHIELD);
		if (global.playerShield > 0) { global.playerShield -= global.attackRandom; }
		else { 
			oSoul.damageTaken += global.attackRandom * -1;
			global.playerHP -= _dmg; 
		};	
	} 
	else {
		global.defenceValue = 0;
		var _dmg = global.attackRandom - global.defenceValue;
		createFloatingText(x, y, _dmg, FLOATING_TEXT_TYPES.DAMAGE);
		if (godMode == 0)  {	
			if (global.playerShield > 0) { global.playerShield -= global.attackRandom; }
			else { 
				global.playerHP -= global.attackRandom; 
				oSoul.damageTaken += global.attackRandom;
			}
		}
	}
	godMode = 50;
}