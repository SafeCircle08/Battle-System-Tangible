function createClickFX(_spr) 
{
	with (oCustomCursor) {
		var _fxN = irandom_range(2, 4);
		for (var i = 0; i < _fxN; i++) {
			var _clickFX = instance_create_layer(x, y, LAYER_EFFECT_TOP, oChangeAlphaDimObjFX);
			_clickFX.sprite_index = _spr;
			_clickFX.image_speed = 0;
			_clickFX.image_index = irandom_range(0, _clickFX.image_number - 1);
			
			var _grv = 0.05;
			var _hsp = irandom_range(-1, 1);
			while (_hsp == 0) {
				_hsp = irandom_range(-1, 1);	
			}
			var _vsp = irandom_range(-0.5, -1);
			
			_clickFX.setUpVars(1, 1, 1, 1, 1, 0, 1, 0, 1, 0.003);
			
			_clickFX.setUpGravity(_grv, _hsp, _vsp);
			_clickFX.rotationAmount = irandom_range(3, 5);
			_clickFX.rotates = true;
		}
	}
}