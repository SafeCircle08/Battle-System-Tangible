function destroyTextBoxText() {
	instance_create_layer(room_width / 2, room_height - 4, LAYER_EFFECT_TOP_3, oFadingOutTxtBoxFX);
	instance_destroy(oTextInstance);
}