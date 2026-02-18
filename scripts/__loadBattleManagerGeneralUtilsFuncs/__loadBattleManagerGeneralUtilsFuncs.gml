function __loadBattleManagerGeneralUtilsFuncs() {
	initializeInventoryAnimations();
	initializeSubBattleMenuAnimations();
	increaseMainMenuXPos = function(){
		if (isInBulletHellSection()) return;
	
		var _goalButtonX = 2;
		if (startButtonX < _goalButtonX) {
			buttonFrame += 0.05;
			startButtonX += 20 * buttonFrame;
		}
		startButtonX = clamp(startButtonX, -200, _goalButtonX);		
	}
	decreaseMainMenuXPos = function(){
		if (startButtonX > startButtonXRef){
			startButtonX -= 5;
			startButtonX = clamp(startButtonX, -200, 100);
		}		
	}
	canIncreaseMenuXPos = function() {
	return (!isInBulletHellSection() && 
			(playerTurn == true) && 
			(showActionsFlavourText == false)) &&
			(!isEnemySpeaking());
	}
	setSelectionDelay = function() { 
		takenOptionDelay = 3; 
	}
	setSubMenuPositions = function(_x, _y){
		subMenuX = _x;
		subMenuY = _y;
	}
	fadeInBattleBlackPinkBgs = function() {
		if (oBlack.image_alpha > 0) { oBlack.image_alpha -= 0.05; } 
		if (oPinkDetails.image_alpha > 0) { oPinkDetails.image_alpha -= 0.05; }	
	}
}