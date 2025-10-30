function stringContaints(_str, _word, _offSet){
	var j = 0;
	for (var i = _offSet; i < string_length(_str); i++) {
		if (string_char_at(_str, i) == string_char_at(_word, j)) { 
			j++;
			continue; 
		}
		return false;
	}	
	return true;
}