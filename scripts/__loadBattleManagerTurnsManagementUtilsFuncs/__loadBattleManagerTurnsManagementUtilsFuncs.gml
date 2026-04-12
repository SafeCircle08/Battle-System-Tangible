function __loadBattleManagerTurnsManagementUtilsFuncs(){
	changeTurn = function(_specific = noone, _playerTurn = noone) {
		
		showActionsFlavourText = false;
		buttonFrame = 0;
		
		if (_specific == noone) playerTurn = !playerTurn;
		else {
			playerTurn = _playerTurn;
		}
		
	
		if (playerTurn == false) goToBulletHellSection();
		else resetEnemySpeakingVars();
	}
	
	setToCanAdvanceTurn = function() {
		canAdvanceTurn = true;
	}
	
	setToCannotAdvanceTurn = function() {
		canAdvanceTurn = false;
	}
	
	increaseTurn = function() {
		if (canAdvanceTurn) turnNumber += 1;
	}
	
	onFirstTurn = function() {
		return turnNumber = 0;	
	}
	
	setToFinishTurnFlavourTxt = function() {
		showActionsFlavourText = true;
		
		actionsFlavourText = [addTextAsPage("*Turn Finished.")];
		menageAfterTurnFlavourTexts();
		
		flavourTextIndex = getRandomIndex(global.battleFlavourTexts);
		battleFlavourText = global.battleFlavourTexts[flavourTextIndex];
	}
	setToStartTurn = function(_specific = true, _playerTurn = true) {
		resetTextVars();
		resetPlayerBattleVars();
		resetActionsFlavourText();
		
		increaseTurn();
		showActionsFlavourText = false;
		flavourTextIndex = 0;
		selected_option = 0;
		actualDrawAlpha = 0;
		enemyIntroText = false;
		enemyWillTalkAfterBulletHellSection = false;
		oBattleBox.setToStartTurn();
		global.enemyTimer = 0;
		global.getTextBoxInputs = true;
		changeTurn(_specific, _playerTurn);
	}

}