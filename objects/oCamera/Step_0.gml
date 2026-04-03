if (keyboard_check_pressed(vk_f12)) {
	window_set_fullscreen(!window_get_fullscreen());
}

var _camW = camera_get_view_width(overWorldCam);
var _camH = camera_get_view_height(overWorldCam);
var _camera;
var _camX;
var _camY;

shakeX = 0;
shakeY = 0;
if (shakeAmount > 0) {
    shakeX = random_range(-shakeAmount, shakeAmount);
    shakeY = random_range(-shakeAmount, shakeAmount);
    shakeAmount *= shakeDecay;
    if (shakeAmount < 0.1) shakeAmount = 0;
}

if (room == Room_Battle) _camera = battleCam;
else {
	_camX = oPlayerOW.x - _camW / 2;
	_camY = oPlayerOW.y - _camH / 2;
	_camX = clamp(_camX, 0, room_width - _camW);
	_camY = clamp(_camY, 0, room_height - _camH);
	_camera = overWorldCam;
	finalCamX += ((_camX - finalCamX) * camTrailSpd);
	finalCamY += ((_camY - finalCamY) * camTrailSpd);

	finalCamX = lerp(finalCamX, _camX, 0.1);
	finalCamY = lerp(finalCamY, _camY, 0.1);
}

camera_set_view_pos(_camera, finalCamX + shakeX, finalCamY + shakeY);
