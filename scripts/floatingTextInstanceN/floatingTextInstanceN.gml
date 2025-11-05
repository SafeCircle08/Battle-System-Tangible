function floatingTextInstanceNumCreatePile(_specificFloatingTextType, _txtRef) {
	var _n = 0;
	for (var i = 0; i < instance_number(oFloatingText); i++) {
		var _floatText = instance_find(oFloatingText, i);
		if (_floatText.typeIndex == _specificFloatingTextType) { 
			createFloatingText(mouse_x, mouse_y - 10 * _n, _txtRef, _specificFloatingTextType);
			_n++; 
		}
	}
}