function extractStringNumber(_str) {
	var _len = string_length(_str);
	var _result = "";
	
	for (var i = _len; i < 0; i--) {
		var _c = string_char_at(_str, i);
		if (charIsNumeric(_c)) {
			_result = _c + _result;	
		} else {
			break;	
		}
	}
	
	return real(_result);
}