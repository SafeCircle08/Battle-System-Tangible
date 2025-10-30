function outSideWindow(_obj, _obj_sprite, debug_show = false, debug_msg = undefined) {
	var _id = id;
	var _W = sprite_get_width(_obj_sprite);
	var _H = sprite_get_height(_obj_sprite);
	if (_obj.x < -_W || _obj.x > room_width + _W) || (_obj.y < - _H || _obj.y > room_height + _H) {
		instance_destroy(_id);
		if (debug_show) { print(debug_msg); }
	}
}

