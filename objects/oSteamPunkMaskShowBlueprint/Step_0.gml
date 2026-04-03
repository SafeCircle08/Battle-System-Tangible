event_inherited();

if (canSetOnBlueprint()) {
	maskSetOnBlueprint();
}

if (showingTimer >= secondsN * GAME_FPS) {
	if (!instance_exists(myBlueprint)) exit;
	
	if (myBlueprint.image_alpha == 1.0) {
		finishedShowing = true;
		maskSetIdle();
	}	
	if (image_alpha < 1.0) image_alpha += MASK_ALPHA_ADDER;
	myBlueprint.image_alpha -= MASK_ALPHA_ADDER;
	if (myBlueprint.image_alpha <= 0.0) instance_destroy(myBlueprint);
}