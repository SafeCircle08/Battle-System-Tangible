randomize();

if (objsCreated == false) {
	createBattleManagerObjects();	
	objsCreated = true;
}

if (playerMainActionTurn()) {
	navigatingBattle(0, 3);
	if (confirmPressed()) {
		decidingSubAction = true;
		oBulletGeneratorManager.generatorCreated = false;
		
		mainPressed = selected_option;
		global.settedMainBattleOptions[selected_option]._selectFunction();
	
		if (moreStepsAct == false) { terminateAction(); }
	}
}

if (showActionsFlavourText) { 
	if (oBlack.image_alpha > 0) { oBlack.image_alpha -= 0.05; } 
	if (oPinkDetails.image_alpha > 0) { oPinkDetails.image_alpha -= 0.05; }
	 decreaseMainMenuXPos();
} else { increaseMainMenuXPos(); }

//Navigating sub actions windows (ex. inventory menu or battle sub menu)
if (decidingSubAction == true) {
	if (playingGuiAnimation) { 
		global.settedMainBattleOptions[mainPressed]._fadeInFunc(); 
	} else { global.settedMainBattleOptions[mainPressed]._fadeOutFunc(); }
	
	if (showingSubWindow) { global.settedMainBattleOptions[mainPressed]._function(); }
	if (actionChoosen) { global.playerEquippedOptions[selected_option]._function(); }	
} else { global.settedMainBattleOptions[mainPressed]._fadeOutFunc(); }

if (isNotPlayerTurn()) {
	increaseEnemyTurnTimer();
	if (turnIsEndingFrame()) { startBeamAnimation(false); }
	if (enemyTimerEnded()) { finishTurn(); }
}