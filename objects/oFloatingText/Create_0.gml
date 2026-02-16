enum FLOATING_TEXT_TYPES {
	DAMAGE,
	SHIELD,
	HEALTH,
	TXT,
	GOLD,
	HEALTH_EXPIRED
}

enum FLOATING_TEXT_DIR {
	LEFT, 
	RIGHT
}

colors = [
	c_custom_red_hit_color, 
	c_custom_shield_color, 
	c_custom_light_green,
	c_white,
	c_yellow,
	c_green
];

drawColor = undefined;

gravity = 0.05;
direction = irandom_range(85, 95);
speed = 1.5;
image_xscale = 2;
image_yscale = 2;
hspeed = 0;

initVars = function(_txtRef, _type) {
	textReference = _txtRef;
	typeIndex = _type;
	drawColor = colors[_type];
	setDirection(manageFlTextDir());		
}

setDirection = function(_dir) {
	var _maxDirSpd = 0.5;
	switch (_dir) {
		case FLOATING_TEXT_DIR.LEFT:
			hspeed = -_maxDirSpd;
		break;
		case FLOATING_TEXT_DIR.RIGHT:
			hspeed = _maxDirSpd;
		break;
	}
}

textReference = 0
typeIndex = 0;