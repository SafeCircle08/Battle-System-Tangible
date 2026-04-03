draw_self();

if (maskOnBlueprint) {
	
	var _alpha = 0.0;
	if (instance_exists(myBlueprint)) _alpha = myBlueprint.image_alpha;
	
	draw_set_alpha(_alpha);
	var _x = getCoreX();
	var _y = getCoreY();
	draw_sprite(sWhiteBoxPulsing, floor(showingTimer / 20), _x, _y - 1);
	drawShakyText(_x + 20, _y, "DESTROY THE\n   CORE", 10, c_white, 0.4, true);
	draw_set_alpha(1.0);
}