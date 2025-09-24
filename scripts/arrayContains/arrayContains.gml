function arrayContains(_arrayRef, _value) {
	for (var i = 0; i < array_length(_arrayRef); i++) {
		if (_arrayRef[i] == _value) {
			return true;
		}
	}
	return false;
}