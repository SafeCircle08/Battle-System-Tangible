function fullHpMessage(_msg) {
	var _hpMaxed = "HPs MAXED OUT!";
	if (digitNotEqualsToSpecialChars(_msg)) { return changeLastDigit(_msg) + _hpMaxed; }
	return _msg + "\n" + _hpMaxed;		
}