function __loadBattleManagerTurnsManagementUtilsFuncs(){
	changeTurn = function() {
		show_debug_message("turno cambiato")
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
		
		actionsFlavourText = [addTextAsPage("*Turn Finished.")];
		menageAfterTurnFlavourTexts();
		
		flavourTextIndex = getRandomIndex(global.battleFlavourTexts);
		battleFlavourText = global.battleFlavourTexts[flavourTextIndex];
	}
	setToStartTurn = function() {
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
		changeTurn();
	}
}