if (!surface_exists(bubbleSurf)) {
    bubbleSurf = surface_create(bubbleW, bubbleH);
}

draw_set_alpha(drawAlpha);

	shader_set(shd_StarBubble);
		shader_set_uniform_f(time_uniform, current_time / 1000);
		shader_set_uniform_f(radius_uniform, bubbleRadius);
		shader_set_uniform_f(freqSpd_uniform, freqSpd);
		shader_set_uniform_f(starPower_uniform, starPower);
		shader_set_uniform_f(alpha_uniform, drawAlpha);
		
		var dx = bubbleW / 2;
		var dy = bubbleH / 2;
		var _x = x - dx;
		var _y = y - dy;
		
		draw_surface_ext(bubbleSurf, _x, _y, 1, 1, 0, c_white, 1);
	shader_reset();

	draw_set_font(fFontino);

	setTextCentered();
		drawTextOutline(string(dotN), x + 1, y);
	resetTextHalignValign();
	
draw_set_alpha(1.0);