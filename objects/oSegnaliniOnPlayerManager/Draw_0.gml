draw_self();
if (canShowInBoxSegnalini()) {
	for (var i = 0; i < array_length(segnaliniOnPlayer); i++) {
		var _angle = 0 - (45 * i);	
		var _r = sprite_get_width(sSegnaliniManager) / 2;
		var _segSprX = x + (cos(_angle) * _r);
		var _segSprY = y + (sin(_angle) * _r);
		var _yAdder = sin(frame / 50) * 5;
		draw_sprite(segnaliniOnPlayer[i], 0, _segSprX - 5, _segSprY - 5 + _yAdder);
	}
} else {
	//Will add a way for the player
	//to see his segnalini even if it's not 
	//his turn.
	//Menu a tendina tipo
}