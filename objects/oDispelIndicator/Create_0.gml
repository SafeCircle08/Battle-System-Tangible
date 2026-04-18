startY = ystart;

rotate = function() {
	if (sprite_index != sDispelIndicatorSelecting) sprite_index = sDispelIndicatorSelecting;
	image_angle += 3;
}

normal = function() {
	if (sprite_index != sDispelIndicator) sprite_index = sDispelIndicator;
	image_angle = lerp(image_angle, 0, 0.3);	
}