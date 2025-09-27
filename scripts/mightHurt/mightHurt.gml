function mightHurt(_prob, _level = 1, _hurtCheck = 2) {
	var _hurtValue = irandom_range(0, _prob);
	if (_hurtValue == _hurtCheck) {
		var _minDmg = 15;
		var _maxDmg = 40;
		var _dmg = irandom_range(_minDmg, _maxDmg) * _level;
		hitPlayer(_dmg);
	}	
}