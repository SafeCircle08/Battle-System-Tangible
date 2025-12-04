x = room_width / 2;
y = room_height;

baseCardSpr = sSegnalinoCardBase;
initialized = false;

goalX = 0;
goalY = room_height - 40;

image_alpha = 0;

//Default values
level = SEGNALINO_LEVEL.LEVEL_1;
type = SEGNALINO_TYPE.DAMAGE;
minValue = undefined;
maxValue = undefined;
segSprite = undefined;
name = undefined;
timer = undefined;

//In card values
minValueTxt = undefined;
maxValueTxt = undefined;
timerTxt = undefined;

levelSpr = sSegnalinoCardLevels;
levelSprIndex = undefined;

typeSpr = sSegnalinoCardTypes;
typeSprIndex = undefined;

refSegnalinoInst = undefined;

moving = false;

cardSetValues = function() {
	
	minValueTxt = string(minValue);
	maxValueTxt = string(maxValue);	
	
	switch (level) {
		case SEGNALINO_LEVEL.LEVEL_1: levelSprIndex = 0; break;	
		case SEGNALINO_LEVEL.LEVEL_2: levelSprIndex = 1; break;	
		case SEGNALINO_LEVEL.LEVEL_3: levelSprIndex = 2; break;	
		case SEGNALINO_LEVEL.LEVEL_4: levelSprIndex = 3; break;	
		case SEGNALINO_LEVEL.LEVEL_5: levelSprIndex = 4; break;	
	}	
	
	switch (type) {
		case SEGNALINO_TYPE.DAMAGE: typeSprIndex = 0; break;
		case SEGNALINO_TYPE.NERF: typeSprIndex = 1; break;
		case SEGNALINO_TYPE.BOOST: typeSprIndex = 2; break;
		case SEGNALINO_TYPE.HEAL: typeSprIndex = 3; break;
	}
	initialized = true;
}