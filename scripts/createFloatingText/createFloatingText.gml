function createFloatingText(_x, _y, _txtRef, _type) {
	var floatingText = instance_create_layer(_x, _y, LAYER_EFFECT_TOP_2, oFloatingText);
	floatingText.textReference = _txtRef;
	floatingText.typeIndex = _type;
	floatingText.drawColor = floatingText.colors[_type];
}