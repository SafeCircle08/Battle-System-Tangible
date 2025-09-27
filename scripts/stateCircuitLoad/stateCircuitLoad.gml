function menageIndicator() {
	if (!instance_exists(oPressIndicator)) { 
		var _indicatorKey = instance_create_layer(oSoul.x, oSoul.y - 25, LAYER_EXTRAS_OBJECTS, oPressIndicator);
		_indicatorKey.toPressKey = vk_space;
	}		
}

function resistanceDamage(_resistance, _minDmg = 5, _maxDmg = 15) {
	return irandom_range(_minDmg, _maxDmg) * _resistance.ohmValue;
}

function stateCircuitLoad(){
	
	stateElectrifing = function() { visible = false; };
	
	stateCircuit = function() 
	{
		stateInit(sPlayerCircuit, function() {
			image_xscale = 1;
			image_yscale = 1;
			var _newX = global.boxOriginX + global.xOffset;
			var _newY = global.boxOriginY + global.yOffset;
			setPlayerPos(_newX, _newY);
		});
		
		var _spd = global.SoulSpeed - 0.5;
		var _actualResistance = instance_place(x, y, oResistanceCircuitPiece);
		if (_actualResistance) { 
			if (_actualResistance.hasTension) {
				var _resistanceDmg = resistanceDamage(_actualResistance);
				if (!playerIsMoving()) {
					var _frameCheck = 50;
					hitPlayerOverTime(_frameCheck, _resistanceDmg);
				}
			}
			_spd = _spd - _actualResistance.ohmValue / 10;
		}
		
		var _actualPositivePole = instance_place(x, y, oPositivePole);
		if (_actualPositivePole) {
			menageIndicator();
			if (keyboard_check_pressed(vk_space)) {
				oPressIndicator.fadeOut = true;
				var _impulse = instance_create_layer(x, y, layer, oElectricImpulse);
				_impulse.positivePoleRef = _actualPositivePole;
				_impulse.negativePoleRef = _actualPositivePole.negativeAttachedPole;
				_impulse.distX = abs(_actualPositivePole.x - _actualPositivePole.negativeAttachedPole.x);
				_impulse.distY = abs(_actualPositivePole.y - _actualPositivePole.negativeAttachedPole.y);
				state = stateElectrifing;
			}
		} else {
			if (instance_exists(oPressIndicator)) {
				oPressIndicator.fadeOut = true;
			}
		}
		
		if (keyboard_check(ord("W"))) {
			if (place_meeting(x, y - _spd, oCircuitPieceParent)) { y -= _spd; }	
		}
		if (keyboard_check(ord("S"))) {
			if (place_meeting(x, y + _spd, oCircuitPieceParent)) { y += _spd; }	
		}
		if (keyboard_check(ord("A"))) {
			if (place_meeting(x - _spd, y, oCircuitPieceParent)) { x -= _spd; }	
		}
		if (keyboard_check(ord("D"))) {
			if (place_meeting(x + _spd, y, oCircuitPieceParent)) { x += _spd; }	
		}
	}	
}