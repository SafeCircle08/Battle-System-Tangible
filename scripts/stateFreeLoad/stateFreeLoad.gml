function stateFreeLoad(){
	stateFree = function()
	{
		stateInit(sNoEffects, function() { image_xscale = 1; image_yscale = 1; });
		if (canMove)
		{
			hsp = (key_right - key_left) * 1.5;
			vsp = (key_down - key_up) * 1.5;

			if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
			x += hsp;
			y += vsp;
		}
		var _possX = clamp(oSoul.x, global.border_l + 7, global.border_r - 7);
		var _possY = clamp(oSoul.y, global.border_u + 7, global.border_d - 7);
		oSoul.x = _possX;
		oSoul.y = _possY;
	}
}