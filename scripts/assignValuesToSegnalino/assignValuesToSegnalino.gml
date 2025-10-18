function assignValuesToSegnalino(_segInst, _name, _type, _segnSpr, _minValue, _maxValue, _lv, _timer) {
	with (_segInst) {
		name = _name;
		type = _type;
		segnalinoSprite = _segnSpr;
		minValue = _minValue;
		maxValue = _maxValue;
		level = _lv;
		timer = _timer * _lv;
	}	
}