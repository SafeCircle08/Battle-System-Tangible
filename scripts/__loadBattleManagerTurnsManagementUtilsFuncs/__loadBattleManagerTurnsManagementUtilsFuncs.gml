function __loadBattleManagerTurnsManagementUtilsFuncs(){
	changeTurn = function() {
		showActionsFlavourText = false;
		playerTurn = !playerTurn; 
		buttonFrame = 0;
	
		if (playerTurn == false) goToBulletHellSection();
		else resetEnemySpeakingVars(); 
	}
	increaseTurn = function() {
		turnNumber += 1;
	}
	setToFinishTurnFlavourTxt = function() {
		showActionsFlavourText = true;
		actionsFlavourText = ["*Turn Finished."]; //special actions text meaning the turn is over
		var _flavourTextProbs = irandom_range(0, 7);
		if (_flavourTextProbs == 6) { menageAfterTurnFlavourTexts(); }
		flavourTextIndex = getRandomIndex(global.battleFlavourTexts);
		battleFlavourText = global.battleFlavourTexts[flavourTextIndex];
	}
	setToStartTurn = function() {
		resetTextVars();
		resetPlayerBattleVars();
		increaseTurn();
		flavourTextIndex = 0;
		selected_option = 0;
		actualDrawAlpha = 0;
		enemyIntroText = false;
		enemyWillTalkAfterBulletHellSection = false;
		oBattleBox.setToStartTurn();
		global.enemyTimer = 0;
		global.getTextBoxInputs = true;
		changeTurn();
	}
}