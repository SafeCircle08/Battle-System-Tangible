function playerMovement(_reverse = false) {
	if (canMove) {
		var mx = (key_right - key_left) * global.SoulSpeed;
		var my = (key_down - key_up) * global.SoulSpeed;
		
		print("SoulSpd: " + string(global.SoulSpeed)); 
		
		if (_reverse) {
			mx = -mx;
			my = -my;
		}
		
		if (isSliding) {
			hsp += mx * acc; 
			vsp += my * acc;
			if (mx == 0) { hsp *= (1 - iceFriction); }
			if (my == 0) { vsp *= (1 - iceFriction); }
		} else {
			hsp += mx;
			vsp += my;
			if (mx == 0) { hsp = 0; }
			if (my == 0) { vsp = 0; }
		}
		
		hsp = clamp(hsp, -global.SoulSpeed, global.SoulSpeed);
		vsp = clamp(vsp, -global.SoulSpeed, global.SoulSpeed);
		
		x += hsp;
		y += vsp;
		playerMovClampX();
		playerMovClampY();
	}
}