draw_self();

if (global.beamAnimation == true) { 
	if (!instance_exists(oPlayerBeam)) { 
		instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oPlayerBeam); 
	}
	
	if (beamAnimationEnded()) { resetBeamAnimationVariables(); }

	drawBeamAnimation();
}

if (flashAlpha > 0) {
	shader_set(shWhiteEffect);	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,
					flashColor, flashAlpha);
	shader_reset();
}
//if (yellowPopping) { playerYellowPop(); }