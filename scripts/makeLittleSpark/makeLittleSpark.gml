function makeLittleSpark(_time1, _time2, _x, _y)
{
	if ((delta_time % _time1 == 0) || (delta_time % _time2 == 0))
	{
		var _xAdder = irandom_range(-10, 10);
		var _enchStarFX = instance_create_layer(_x + _xAdder, _y, LAYER_EFFECT_TOP, oChangeAlphaDimObjFX);
		_enchStarFX.sprite_index = sSpark;
		_enchStarFX.rotates = true;
		_enchStarFX.rotationAmount = 4;
		_enchStarFX.setUpVars(0.3, 0.3, 0, 0, 1, 0.5, 1, 0, 1, 0.02);
		_enchStarFX.setUpGravity(0.05, irandom_range(-1, 1), -1);
	}
}