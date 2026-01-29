function arrayGetIndexOfValue(_list, _checkValue) {
	for (var i = 0; i < array_length(_list); i++) {
		if (_list[i] == _checkValue) {
			return i;
		}
	}
	return -1;
}