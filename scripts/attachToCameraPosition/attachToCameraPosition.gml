function attachToCameraBothPositions(_xOffset = 0, _yOffset = 0) {
	x = camera_get_view_x(view_camera[view_current]) + _xOffset;
	y = camera_get_view_y(view_camera[view_current]) + _yOffset;
}