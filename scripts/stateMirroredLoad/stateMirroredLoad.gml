function stateMirroredLoad(){
	stateMirrored = function()
	{
		stateInit(sInvertedEffect);
		hsp = (key_left - key_right) * global.SoulSpeed;
		vsp = (key_up - key_down) * global.SoulSpeed;
		if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
		x += hsp * (delta_time / 1_000_000) * WANTED_FPS;
		y += vsp * (delta_time / 1_000_000) * WANTED_FPS;
		var _possX = clamp(oSoul.x, global.border_l + 7, global.border_r - 7);
		var _possY = clamp(oSoul.y, global.border_u + 7, global.border_d - 7);
		oSoul.x = _possX;
		oSoul.y = _possY;
	}
}