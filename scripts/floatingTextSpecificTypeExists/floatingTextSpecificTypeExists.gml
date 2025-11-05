function floatingTextSpecificTypeExists(_type) {
	for (var i = 0; i < instance_number(oFloatingText); i++) {
		var _floatingText = instance_find(oFloatingText, i);
		if (_floatingText.typeIndex == _type) {
			return true;	
		}
	}
	return false;
}