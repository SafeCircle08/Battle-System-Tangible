overWorldCam = camera_create_view(0, 0, 288, 216);
camera_set_view_pos(overWorldCam, 0, 0);
view_set_camera(0, overWorldCam);

battleCam = camera_create_view(0, 0, 288, 216);

var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);
finalCamX = oPlayerOW.x - (_w / 2);
finalCamY = oPlayerOW.y - (_h / 2);

camTrailSpd = 0.1;

shakeX = 0;
shakeY = 0;
shakeAmount = 0;
shakeDecay = 0.9;

shake = function(_power) {
	shakeAmount = max(shakeAmount, _power);	
}

function clampCameraValue() {
	var _w = camera_get_view_width(overWorldCam);
	var _h = camera_get_view_height(overWorldCam);
	finalCamX = oPlayerOW.x - (_w / 2);
	finalCamY = oPlayerOW.y - (_h / 2);
	finalCamX = clamp(finalCamX, 0, room_width - _w);
	finalCamY = clamp(finalCamY, 0, room_height - _h);		
}

enum POINTS	{
	TOP_LEFT, 
	TOP_RIGHT, 
	BOTTOM_RIGHT,
	BOTTOM_LEFT
}

enum DIMS {
	HALF_HEIGHT,
	HALF_WIDTH,
	HEIGHT,
	WIDTH,
}

point = function(_x, _y) {
	return { _pX: _x, _pY: _y }
}

getPoint = function(_point) {
	switch (_point) {
		case POINTS.TOP_RIGHT: return point(finalCamX, finalCamY);	
		case POINTS.TOP_LEFT: return point(finalCamX + getWidth(), finalCamY);	
		case POINTS.BOTTOM_RIGHT: return point(finalCamX + getWidth(), finalCamY + getHeight());	
		case POINTS.BOTTOM_LEFT: return point(finalCamX, finalCamY + getHeight());	
	}
}

getDims = function(_dimension) {
	switch (_dimension) {
		case DIMS.HALF_HEIGHT: return finalCamY + getHeight() / 2;
		case DIMS.HALF_WIDTH: return finalCamX + getWidth() / 2;	
		case DIMS.HEIGHT: return finalCamY + getHeight();
		case DIMS.WIDTH: return finalCamX + getWidth();
	}
}

getX = function() { return finalCamX; }
getY = function() { return finalCamY; }
getWidth = function() { return camera_get_view_width(view_camera[view_current]); }
getHeight = function() { return camera_get_view_height(view_camera[view_current]); }