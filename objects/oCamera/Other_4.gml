clampCameraValue();

if (room == Room_Battle) {
	camera_set_view_pos(battleCam, 0, 0);
	view_set_camera(0, battleCam);	
} else {
	camera_set_view_pos(overWorldCam, 0, 0);
	view_set_camera(0, overWorldCam);	
}
