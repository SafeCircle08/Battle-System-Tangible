enum SEGNALINO_TYPE {
	DAMAGE, 
	NERF,
	BOOST,
	HEAL
}

type = SEGNALINO_TYPE.DAMAGE;
level = 0;
segnalinoSprite = sNightVisionEnchProperty; //default
name = "";
timer = 0;
minValue = 0;
maxValue = 0;

addSegnalinoCard = function() {
	var _segnalinoCard = instance_create_layer(room_width / 2, room_height / 2, LAYER_SEGNALINI_CARDS, oSegnalinoCard);
	_segnalinoCard.type = type;
	_segnalinoCard.name = name;
	_segnalinoCard.level = level;
	_segnalinoCard.timer = timer;
	_segnalinoCard.sprite = segnalinoSprite;
	_segnalinoCard.minValue = minValue;
	_segnalinoCard.maxValue = maxValue;
}

printSegnalinoInfos = function() {
	print("Type: " + string(type));	
	print("LV: " + string(level));
	print("Sprite: " + string(segnalinoSprite));	
	print("Name: " + string(name));
	print("Timer: " + string(timer));
	print("minValue: " + string(minValue));	
	print("maxValue: " + string(maxValue));
}

addSegnalino = function(_segnalino = segnalinoSprite) {
	if (!instance_exists(oSegnaliniOnPlayerManager)) {
		instance_create_layer(0, 0, LAYER_EFFECT_TOP_2, oSegnaliniOnPlayerManager);	
	}
	if (segnalinoAlreadyOnAction(_segnalino)) { return; }
	oSegnaliniOnPlayerManager.segnaliniN++;
	array_push(oSegnaliniOnPlayerManager.segnaliniOnPlayer, _segnalino);
	
	//crea la carta
	
	//ogni volta che viene aggiunta una carta, andare ad eseguire il ciclo
	//sulle carte, e assegnare ad ognuna le loro coordinate.
	//Ogni posizionamento ha un array preimpostato.
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
	instance_destroy(self);
}

createSegnalino = function(_segnalinoSpr) {
	segnalinoSprite = _segnalinoSpr;
	addSegnalino();
}