function getFloatingTextHealthType(_item) {
	var _healFlText = FLOATING_TEXT_TYPES.HEALTH;
	if (variable_struct_exists(_item, "expired")) {
		_healFlText = FLOATING_TEXT_TYPES.HEALTH_EXPIRED;
	}
	return _healFlText;
}