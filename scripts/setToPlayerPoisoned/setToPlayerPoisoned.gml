 #macro SEGNALINO_POISON "poison"

function setToPlayerPoisoned() {
	var _poisonFunc = function() {
		var _poisonHit = 100;
		static frame = 0;
		frame += 1;
		if (frame % _poisonHit == 0) {
			var _poisonDmg = irandom_range(20, 50);
			hitPlayer(_poisonDmg);	
			frame = 0;
		}
	}
	var _poisonHit = 100;
	oSoul.setSegnalino(_poisonFunc, (_poisonHit * 10) + 1, SEGNALINO_POISON);
}