function mosueCursorIsColliding_centerOrigin(_instance) {
	var _w = sprite_get_width(_instance.sprite_index);
	var _h = sprite_get_height(_instance.sprite_index);
	if (
		(mouse_x > _instance.x - (_w / 2) && mouse_x < _instance.x + (_w / 2)) &&
		(mouse_y < _instance.y + (_h / 2) && mouse_y > _instance.y - (_h / 2))
	) return true;
	return false;
}