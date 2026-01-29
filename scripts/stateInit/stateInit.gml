//Used to initialize the new state
//Start of the turn
function createPlayerStateEffect(_effect, _otherInits = function() {}) {
	effect = instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect);
	effect.sprite_index = _effect;
	_otherInits();
	return;		
}

//Only called during the beam animation
function stateInit(_sprEffect, _method = function() {}) {
	createPlayerStateEffect(_sprEffect, _method());
}