function attachToCameraXPosition(_offSet = 0) {
	x = camera_get_view_x(view_camera[view_current]) + _offSet;
}