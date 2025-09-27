//Used to initialize the new state
//Start of the turn
function setPlayerStateEffect(_effect, _otherInits = function() {})
{
	effect = instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect);
	effect.sprite_index = _effect;
	_otherInits();
	return;		
}

//Only called during the beam animation
function stateInit(_sprEffect, _method = function() {})
{
	var _beamValue = BEAM_ANIMATION_TIMER_REF / 2 - 1;
	if (global.beamAnimationTimer == 1) { 
		setPlayerStateEffect(_sprEffect, _method());
		oSoul.startX = oSoul.x;
		oSoul.startY = oSoul.y;
	}
}