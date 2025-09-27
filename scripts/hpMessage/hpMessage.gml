function hpMessage(_msg, _hp) { 
	var _hpMsg = "(Recovers " + string(_hp) + "HPs)";
	if (digitNotEqualsToSpecialChars(_msg)) { return changeLastDigit(_msg) + _hpMsg; }
	return _msg + "\n" + _hpMsg;
}