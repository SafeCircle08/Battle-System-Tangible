function createGravityParticles(
	_spr, _layer, _num, _x, _y, _imageSpd = 0,
	_maxhspd = 2, _minhspd = -2, 
	_maxvspd = -1, _minvspd = -2, _grv = 0.07,
	_rotation = false, _rotSpd = 0,
	_reduceAlpha = false, _alphaValue = 0, _imageIndex = 0
	) {
	for (var i = 0; i < _num; i++) {
		var _part = instance_create_layer(_x, _y, _layer, oGravityParticle);
		
		if (is_array(_spr)) {
			var _index = arrayGetValidIndex(_spr);
			_part.sprite_index = _spr[_index];	
		} else { _part.sprite_index = _spr; }
		
		_part.image_speed = _imageSpd;
		_part.image_index = _imageIndex;
		if (_rotation) { _part.setToRotation(_rotSpd); }
		if (_reduceAlpha) { _part.setToReduceAlpha(_alphaValue); }
		_part.hspeed = irandom_range(_minhspd, _maxhspd);
		_part.vspeed = irandom_range(_minvspd, _maxvspd);
		_part.gravity = _grv;
	}
}