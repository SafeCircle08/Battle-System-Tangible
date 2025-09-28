segnalinoSprite = sNightVisionEnchProperty; //default

addSegnalino = function(_segnalino = segnalinoSprite) {
	if (!instance_exists(oSegnaliniOnPlayerManager)) {
		instance_create_layer(0, 0, LAYER_EFFECT_TOP_2, oSegnaliniOnPlayerManager);	
	}
	if (segnalinoAlreadyOnAction(_segnalino)) { return; }
	oSegnaliniOnPlayerManager.segnaliniN++;
	array_push(oSegnaliniOnPlayerManager.segnaliniOnPlayer, _segnalino);
}

segnalinoAlreadyOnAction = function(_segSprite) {
	if (arrayContains(oSegnaliniOnPlayerManager.segnaliniOnPlayer, _segSprite)) {
		return true;	
	}
	return false;
}

destroySegnalino = function(_sprite = segnalinoSprite) {
	//Manages the manager segnalini list
	var _index;
	var _found = false;
	for (var i = 0; i < array_length(oSegnaliniOnPlayerManager.segnaliniOnPlayer); i++) {
		if (oSegnaliniOnPlayerManager.segnaliniOnPlayer[i] == segnalinoSprite) {
			_index = i;
			_found = true;
			break;
		}
	}
	if (_found == false) { return; }
	
	//See if the segnalini manager can be destroyed
	with (oSegnaliniOnPlayerManager) {
		array_delete(segnaliniOnPlayer, _index, 1);
		segnaliniN--;
		if (managerHasNoSegnalini()) {
			startFadeOut();
			with (oBigCircleDeco) { startFadeOut(); }
		}	
	}
	//Destroy the actual segnalino (effect finished)
	instance_create_layer(
		oSegnaliniOnPlayerManager.x, 
		oSegnaliniOnPlayerManager.y, 
		LAYER_EFFECT_TOP_3,
		oSegnalinoFinishedFX
	);
	print("segnalino tolto")
	instance_destroy(self);
}

createSegnalino = function(_segnalinoSpr) {
	segnalinoSprite = _segnalinoSpr;
	addSegnalino();
}