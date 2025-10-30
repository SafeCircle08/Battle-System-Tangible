function createBubbleParticle(_spr, _x, _y, _layer, _freq, _wLength, _hLength) {
	static timer = 0;
	timer++;
	
	if (timer % _freq == 0) {
		timer = 0;
		var _finalBubbleX = _x + irandom_range(-_wLength, _wLength); 
		var _finalBubbleY = _y + irandom_range(-_hLength, _hLength);
		var _bubble = instance_create_layer(_finalBubbleX, _finalBubbleY, _layer, oBubble);
		_bubble.sprite_index = _spr;
		_bubble.image_speed = choose(0.5, 1);
	}
}