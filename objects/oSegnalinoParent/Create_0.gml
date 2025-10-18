enum SEGNALINO_TYPE {
	DAMAGE = 0, 
	NERF = 1,
	BOOST = 2,
	HEAL = 3
}

enum SEGNALINO_LEVEL {
	LEVEL_1 = 1,	
	LEVEL_2 = 2,	
	LEVEL_3 = 3,	
	LEVEL_4 = 4,	
	LEVEL_5 = 5,	
}

type = SEGNALINO_TYPE.DAMAGE;
level = SEGNALINO_LEVEL.LEVEL_1;
segnalinoSprite = sNightVisionEnchProperty; //default
name = "";
timer = 0;
minValue = 0;
maxValue = 0;

createdCard = undefined;

addSegnalinoCard = function() {
	var _card = instance_create_layer(0, 0, LAYER_SEGNALINI_CARDS, oSegnalinoCard);
	createdCard = _card;
	with (_card) {
		level = other.level;
		type = other.type;
		minValue = other.minValue;
		maxValue = other.maxValue;
		segSprite = other.segnalinoSprite;
		name = other.name;
		timer = other.timer;	
	}
	for (var i = 0; i < instance_number(oSegnalinoCard); i++) {
		if (instance_number(oSegnalinoCard) == 2) {
			var _positions = [[144 - 50, 30],[144 + 50, 30]];
			var _actualCard = instance_find(oSegnalinoCard, i);
			_actualCard.x = _positions[i][0];
			_actualCard.y = _positions[i][1];
		}
	}
}

removeSegnalinoCard = function() {
	if (instance_exists(createdCard)) {
		instance_destroy(createdCard);
		createdCard = undefined;
	}
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
	removeSegnalinoCard();
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