//Initializing the turn with the beam animation
function initializeNewTurn(createT, created, timer, bltCreated, bW, bH, bX, bY, _playerState) {
	startBeamAnimation();
	genTimeVars(createT, created, timer, bltCreated);
	boxDimensions(bW, bH);
	setBoxOrigin(bX, bY);
	playerChangeState(_playerState, function() {})
	backGroundLayersVisible(oBattleManager.layers, true);
	resetBlackBattleBgAlpha();
	startMovingCards();
}

function destroyBulletsGensExtras() {
	if (instance_exists(oBulletParent)) { instance_destroy(oBulletParent); }
	if (instance_exists(oBulletGeneratorParent)) { instance_destroy(oBulletGeneratorParent); }
	if (instance_exists(oExtrasParent)) { instance_destroy(oExtrasParent); }		
}

//used to finish a turn, by creating the beam animation
function finishTurn() {	
	if (instance_exists(oBoxSidePlatformParent)) { instance_destroy(oBoxSidePlatformParent); }
	with (oBattleManager) {
		backGroundLayersVisible(layers, false);
		setManagerValuesToStartTurn();
	}
	resetPlayerBattleVars();
	destroyBulletsGensExtras();
	resetCardsPositions();
}