sprite_index = setToGuiTxtBoxSelectedTheme();

startY = undefined;
goalX = undefined;
goalY = undefined;

camX = 0;
camY = 0;

vy = -6;
grav = 0.4;

onEnding = false;

startDestroyAnimation = function() {
	onEnding = true;	
}

destroyinAnimation = function() {
	vy += grav;
	y += vy; 

	if (y >= startY) {
	    y = startY;
	    vy = 0;
	}
	
	image_xscale -= 0.02;
	image_alpha -= 0.03;
	if (image_alpha <= 0) instance_destroy(self);
}

dark = instance_create_layer(camX, camY, LAYER_OW_DARK, oDark);
dark.image_alpha = 0;
dark.depth = 500;