enum FLOATING_TEXT_TYPES {
	DAMAGE,
	SHIELD,
	HEALTH,
	TXT,
}

colors = [
	c_custom_red_hit_color, 
	c_custom_shield_color, 
	c_custom_light_green,
	c_white
];
drawColor = undefined;

gravity = 0.05;
direction = irandom_range(85, 95);
speed = 1.5;
image_xscale = 2;
image_yscale = 2;
hspeed = choose(-0.5, 0.5);

textReference = 0
typeIndex = 0;