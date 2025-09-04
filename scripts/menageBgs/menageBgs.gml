function backGroundLayersVisible(_layers, _visible) {
	if (is_array(_layers)) {
		for (var i = 0; i < array_length(_layers); i++) {
			layer_set_visible(_layers[i], _visible);	
		}
		return;
	}
	layer_set_visible(_layers, _visible);
}