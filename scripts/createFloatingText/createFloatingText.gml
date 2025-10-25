function createFloatingText(_x, _y, _txtRef, _type) {
	var dmg = instance_create_layer(_x, _y, LAYER_BULLETS, oFloatingText);
	dmg.textReference = _txtRef;
	dmg.typeIndex = _type;
	dmg.drawColor = dmg.colors[_type];
}