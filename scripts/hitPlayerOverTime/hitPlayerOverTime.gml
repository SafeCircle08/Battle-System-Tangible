function hitPlayerOverTime(_amount, _dmg) {
	static _timer = 0;
	_timer++;
	if (_timer % _amount == 0) {
		hitPlayer(_dmg);	
	}
	if (_timer == _amount * 2 + 1) { _timer = 0; }
}