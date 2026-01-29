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

playSoundNotPlaying(sndSettedSegnalino, SOUND_CHANNEL_2);

type = SEGNALINO_TYPE.DAMAGE;
level = SEGNALINO_LEVEL.LEVEL_1;
segnalinoSprite = sNightVisionEnchProperty; //default
name = "";
timer = 0;
minValue = 0;
maxValue = 0;

createdCard = undefined;

#region UTILS

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
		if (oBattleManager.isInBulletHellSection()) { moving = true; }
		else { moving = false; }
	}
	_card.refSegnalinoInst = self;
	rearrangeCardPositions();
}

rearrangeCardPositions = function() {
	var _cardN = instance_number(oSegnalinoCard);
	for (var i = 0; i < _cardN; i++) {
		var _cardSprW = sprite_get_width(sSegnalinoCardBase);
		var _cardXRef = (room_width / 2) - ((_cardSprW / 2) * (_cardN - 1));
		
		var _actualCard = instance_find(oSegnalinoCard, i);
		_actualCard.goalX = _cardXRef + (i * _cardSprW);		
	}
}

removeSegnalinoCard = function() {
	if (instance_exists(createdCard)) {
		instance_destroy(createdCard);
		createdCard = undefined;
	}
	rearrangeCardPositions();
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

segnalinoAlreadyOnAction = function(_segSprite) {
	if (arrayContains(oSegnaliniOnPlayerManager.segnaliniOnPlayer, _segSprite)) {
		return true;	
	}
	return false;
}

manageSegnaliniOnSegnaliniManager = function(_index) {
	with (oSegnaliniOnPlayerManager) {
		array_delete(segnaliniOnPlayer, _index, 1);
		segnaliniN--;
		if (managerHasNoSegnalini()) {
			startFadeOut();
			with (oBigCircleDeco) { startFadeOut(); }
		}	
	}		
}

segManagerList = function() { return (oSegnaliniOnPlayerManager.segnaliniOnPlayer);  }

createSegnalinoFinishedFX = function() {
	if (instance_exists(oSegnalinoFinishedFX)) return;
	instance_create_layer(
		oSegnaliniOnPlayerManager.x, 
		oSegnaliniOnPlayerManager.y, 
		LAYER_EFFECT_TOP_3,
		oSegnalinoFinishedFX
	);		
}

getSegnalinoIndex = function(_sprite) { 
	return arrayGetIndexOfValue(segManagerList(), _sprite); 
}

#endregion

#region MAIN FUNCTIONS

destroySegnalino = function(_sprite = segnalinoSprite) {
	var _index = getSegnalinoIndex(_sprite);
	var _found = segnalinoAlreadyOnAction(_sprite);
	if (_found == false) { return; }
	
	manageSegnaliniOnSegnaliniManager(_index);
	removeSegnalinoCard();
	createSegnalinoFinishedFX();
	instance_destroy();
}

addSegnalino = function(_segnalino = segnalinoSprite) {
	if (!instance_exists(oSegnaliniOnPlayerManager)) {
		instance_create_layer(0, 0, LAYER_EFFECT_TOP, oSegnaliniOnPlayerManager);	
	} else {
		with (oSegnaliniOnPlayerManager) { startFadeIn(); } //bug fixato, fixa solo il fatto che deve fare un giro e gestisci il bigCircleDeco
	}
	if (segnalinoAlreadyOnAction(_segnalino)) { return; }
	oSegnaliniOnPlayerManager.segnaliniN++;
	array_push(oSegnaliniOnPlayerManager.segnaliniOnPlayer, _segnalino);
}

createSegnalino = function(_segnalinoSpr) {
	segnalinoSprite = _segnalinoSpr;
	addSegnalino();
}

//A function that removes the segnalino
//and can perform additional events
removeRealSegnalino = function() {}

#endregion